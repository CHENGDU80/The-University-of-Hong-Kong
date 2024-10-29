import 'package:chengdu80_prototype/dorj/animated_list.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Claim extends StatefulWidget {
  const Claim({super.key});

  @override
  State<Claim> createState() => _ClaimState();
}

class _ClaimState extends State<Claim> {
  final supabase = Supabase.instance.client;
  var count = 1000;
  var showNew = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
        stream: supabase.from('claim').stream(primaryKey: ['id']),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()]);
          }
          final c = snapshot.data!.length;
          if (c > count) {
            showNew = true;
          }
          count = c;
          return FutureBuilder(
            future: Future.delayed(Duration(seconds: showNew ? 5 : 0)),
            builder: (context, fSnapshot) {
              if (fSnapshot.connectionState == ConnectionState.done) {
                final List<MyAnimatedList> arr =
                    snapshot.data!.map((Map<String, dynamic> data) {
                  return MyAnimatedList(data: data, show: false);
                }).toList();
                arr.sort((a, b) =>
                    DateTime.parse(b.data['created']).millisecondsSinceEpoch -
                    DateTime.parse(a.data['created']).millisecondsSinceEpoch);
                arr[0].show = showNew;

                return ListView(children: arr);
              }
              return const Center(child: CircularProgressIndicator());
            },
          );
        });
  }
}
