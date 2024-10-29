import 'chat/chat.dart';
import 'insight/insight.dart';
import 'package:flutter/material.dart';

class Policy extends StatelessWidget {
  const Policy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Row(
        children: [
          Expanded(child: Insight()),
          ChatUI(),
        ],
      ),
    );
  }
}
