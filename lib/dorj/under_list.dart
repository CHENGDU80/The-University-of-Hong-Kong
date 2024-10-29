import 'package:cached_network_image/cached_network_image.dart';
import 'package:chengdu80_prototype/dorj/contract_info.dart';
import 'package:chengdu80_prototype/dorj/hyperlink.dart';
import 'package:chengdu80_prototype/dorj/realtime.dart';
import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UnderWriteList extends StatefulWidget {
  final Map<String, dynamic> data;
  bool show;
  UnderWriteList({super.key, required this.data, required this.show});

  @override
  State<UnderWriteList> createState() => _UnderWriteListState();
}

class _UnderWriteListState extends State<UnderWriteList> {
  bool isClosed = true;
  final supabase = Supabase.instance.client;
  Future<String> getDownloadURL(String path) async {
    return supabase.storage.from("apollo_images").getPublicUrl("cars/$path");
  }

  Future<String> getDownloadPDF(String path) async {
    return supabase.storage.from("apollo_images").getPublicUrl("pdf/$path");
  }

  String imgURL = "", pdfURL = "";

  @override
  void initState() {
    super.initState();

    getDownloadURL(widget.data["image"]).then((url) {
      setState(() {
        imgURL = url;
      });
    });

    getDownloadPDF(widget.data["document"]).then((url) {
      setState(() {
        pdfURL = url;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isClosed = !isClosed;
        });
      },
      child: Column(
        children: [
          LocalHeroScope(
            child: isClosed
                ? ListTile(
                    leading: imgURL == ""
                        ? const CircularProgressIndicator()
                        : LocalHero(
                            tag: "sex",
                            child: CachedNetworkImage(
                              imageUrl: imgURL,
                              width: 50,
                              height: 50,
                            ),
                          ),
                    title: Row(
                      children: [
                        ContInfo(
                            "Policy Number",
                            DateTime.now()
                                    .toString()
                                    .substring(0, 10)
                                    .replaceAll("-", "") +
                                widget.data['id'].toString()),
                        const SizedBox(width: 5),
                        widget.show
                            ? const Text(
                                "new",
                                style: TextStyle(color: Colors.green),
                              )
                            : Container()
                      ],
                    ),
                    subtitle: Text(
                        "${(widget.data.containsKey("created") ? widget.data['created'].toString().substring(0, 10) : "")} - ${widget.data["name"]} - ${widget.data["brand"]} ${widget.data["model"]} - ${widget.data["phone"]}"),
                    trailing: Text(
                      "${widget.data.containsKey("amount") ? widget.data["amount"] : "0"} RMB",
                      style: const TextStyle(fontSize: 20),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          LocalHero(
                            tag: "sex",
                            child: CachedNetworkImage(
                              imageUrl: imgURL,
                              width: 300,
                              height: 300,
                            ),
                          ),
                          Text(
                              "${widget.data["brand"]} ${widget.data["model"]}"),
                          Text(widget.data.containsKey("created")
                              ? widget.data['created']
                                  .toString()
                                  .substring(0, 10)
                              : ""),
                          const SizedBox(height: 10),
                        ],
                      ),
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              ContInfo(
                                  "Policy ID",
                                  DateTime.now()
                                          .toString()
                                          .substring(0, 10)
                                          .replaceAll("-", "") +
                                      (widget.data["id"] ?? "").toString()),
                              ContInfo(
                                  "Issued Date", widget.data["issued"] ?? ""),
                              ContInfo(
                                  "Expiry Date", widget.data["expiry"] ?? ""),
                              ContInfo("Name", widget.data["name"] ?? ""),
                              ContInfo("Contact", widget.data["phone"] ?? ""),
                              ContInfo("Occupation",
                                  widget.data["occupation"] ?? ""),
                              ContInfo("VIN", widget.data["vin"] ?? ""),
                              ContInfo("Mile", widget.data["mile"] ?? ""),
                              ContInfo("Manufactoring date",
                                  widget.data["year_manufactor"] ?? ""),
                              const Text(
                                'Location: ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                widget.data["address"] ?? "",
                                style: const TextStyle(fontSize: 16),
                              ),
                              ContInfo("Premium",
                                  "${widget.data["amount"] ?? ""} RMB"),
                              HyperLink(
                                  url: pdfURL,
                                  text: "Contract Link",
                                  icon: Icons.link)
                              // ContInfo("Description",
                              //     widget.data["description"]),
                            ]),
                      ),
                      const SizedBox(width: 80),
                      const Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Real-Time Risk Behavior",
                              style: TextStyle(fontSize: 24),
                            ),
                            RealtimeChart(),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
