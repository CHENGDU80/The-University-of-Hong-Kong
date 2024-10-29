import 'package:chengdu80_prototype/common/function/context/navigator.dart';
import 'package:chengdu80_prototype/josh/buying/buying.dart';
import 'package:chengdu80_prototype/dorj/house.dart';
import 'package:chengdu80_prototype/josh/claiming/claiming.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                pushPage(context, const BuyingUI());
              },
              child: const Text('Josh buying'),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                pushPage(context, const ClaimingUI());
              },
              child: const Text('Josh claiming'),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                pushPage(context, const House());
              },
              child: const Text('Dorj'),
            ),
          ],
        ),
      ),
    );
  }
}
