import 'package:chengdu80_prototype/dorj/under_list.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Management extends StatefulWidget {
  const Management({super.key});

  @override
  State<Management> createState() => _ManagementState();
}

class _ManagementState extends State<Management> {
  final supabase = Supabase.instance.client;
  var count = 1000;
  var showNew = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: supabase.from('underwrite').stream(primaryKey: ['id']),
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
                final List<UnderWriteList> arr =
                    snapshot.data!.map((Map<String, dynamic> data) {
                  return UnderWriteList(data: data, show: false);
                }).toList();
                arr.sort((a, b) =>
                    DateTime.parse(b.data['created']).millisecondsSinceEpoch -
                    DateTime.parse(a.data['created']).millisecondsSinceEpoch);
                arr[0].show = showNew;
                return ListView(
                  children: arr,
                );
              }
              return const Center(child: CircularProgressIndicator());
            });
      },
    );
  }
}
