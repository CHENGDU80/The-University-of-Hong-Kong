import 'bar.dart';
import 'content/content.dart';
import 'content/object.dart';
import 'package:flutter/material.dart';

List<ChatMessage> fakeMessages() {
  return [
    ChatMessage(
      sender: ChatSender.client,
      message: 'Hello, I want to know more about this product',
      time: DateTime.now(),
    ),
    ChatMessage(
      sender: ChatSender.sales,
      message: 'Sure, what do you want to know?',
      time: DateTime.now(),
    ),
  ];
}

class ChatUI extends StatelessWidget {
  const ChatUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
              child: ChatContentUI(
            messages: fakeMessages(),
          )),
          const ChatBar(),
        ],
      ),
    );
  }
}
