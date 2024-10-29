import 'object.dart';
import 'package:flutter/material.dart';

class ChatMessageUI extends StatelessWidget {
  final ChatMessage message;
  const ChatMessageUI({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.sender == ChatSender.client
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: message.sender == ChatSender.client
              ? Colors.grey.shade100
              : Colors.blue.shade50,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(24),
            topRight: const Radius.circular(24),
            bottomLeft: message.sender == ChatSender.sales
                ? const Radius.circular(24)
                : Radius.zero,
            bottomRight: message.sender == ChatSender.sales
                ? Radius.zero
                : const Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            Text(
              message.message,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
