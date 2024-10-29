import 'package:cached_network_image/cached_network_image.dart';
import 'package:chengdu80_prototype/dorj/contract_info.dart';
import 'package:chengdu80_prototype/dorj/gauge.dart';
import 'package:chengdu80_prototype/dorj/hyperlink.dart';
import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyAnimatedList extends StatefulWidget {
  final Map<String, dynamic> data;
  bool show;
  MyAnimatedList({super.key, required this.data, required this.show});

  @override
  State<MyAnimatedList> createState() => _MyAnimatedListState();
}

class _MyAnimatedListState extends State<MyAnimatedList> {
  bool isClosed = true;
  final supabase = Supabase.instance.client;
  Future<String> getDownloadURL(String path) async {
    return supabase.storage.from("apollo_images").getPublicUrl("cars/$path");
  }

  String imgURL = "";

  @override
  void initState() {
    super.initState();

    getDownloadURL(widget.data["image"]).then((url) {
      setState(() {
        imgURL = url;
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
                        ContInfo("Policy Number",
                            "${DateTime.now().toString().substring(0, 10).replaceAll("-", "") + widget.data["id"].toString()} - ${(widget.data['title'] ?? "")}"),
                        const SizedBox(width: 5),
                        widget.show
                            ? const Text(
                                "new",
                                style: TextStyle(color: Colors.green),
                              )
                            : Container()
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        widget.data["approved"]
                            ? const Text(
                                "Approved",
                                style: TextStyle(color: Colors.green),
                              )
                            : (widget.data["human_inter"] ?? false
                                ? const Text(
                                    "Human Required",
                                    style: TextStyle(color: Colors.orange),
                                  )
                                : const Text(
                                    "Denied",
                                    style: TextStyle(color: Colors.red),
                                  )),
                        const SizedBox(width: 5),
                        Text(widget.data.containsKey("created")
                            ? widget.data['created'].toString().substring(0, 10)
                            : ""),
                      ],
                    ),
                    trailing: Text(
                      "${widget.data.containsKey("amount") ? widget.data["amount"].toString() : "0"} RMB",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                widget.data["title"],
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ContInfo(
                                            "Policy ID",
                                            DateTime.now()
                                                    .toString()
                                                    .substring(0, 10)
                                                    .replaceAll("-", "") +
                                                widget.data["id"].toString()),
                                        ContInfo("Name", widget.data["name"]),
                                        ContInfo("Age",
                                            widget.data["age"].toString()),
                                        ContInfo(
                                            "Contact", widget.data["contact"]),
                                        const Text(
                                          'Location: ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          widget.data["location"],
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        ContInfo("Requested Amount",
                                            "${widget.data["req_amount"] ?? "0"} RMB"),
                                        widget.data["approved"]
                                            ? ContInfo("Reimbursed Amount",
                                                "${widget.data["rem_amount"] ?? "0"} RMB")
                                            : (widget.data["human_inter"] ??
                                                    false)
                                                ? ContInfo("Suggested Amount",
                                                    "${widget.data["rem_amount"] ?? "0"} RMB")
                                                : Container(),
                                        ContInfo(
                                            "Status",
                                            (widget.data["approved"] ?? false)
                                                ? "Approved"
                                                : (widget.data["human_inter"] ??
                                                        false
                                                    ? "Human required"
                                                    : "Denied")),
                                        // ContInfo("Description",
                                        //     widget.data["description"]),
                                        const Text(
                                          'Description: ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          widget.data["description"],
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ]),
                                ),
                                const SizedBox(width: 80),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HyperLink(
                                        url: widget.data["link_contract"] ?? "",
                                        text: "Insurance Contract",
                                        icon: Icons.edit_document,
                                      ),
                                      HyperLink(
                                        url: widget.data["link_data"] ?? "",
                                        text: "IoT Raw Data",
                                        icon: Icons.data_array,
                                      ),
                                      HyperLink(
                                        url: widget.data["support"] ?? "",
                                        text: "Supporting documents",
                                        icon: Icons.document_scanner,
                                      ),
                                      const SizedBox(height: 40),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          MyGauge(
                                            value: double.parse(
                                                widget.data["confidence"]),
                                          ),
                                          ContInfo("Confidence",
                                              widget.data["confidence"]),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
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
