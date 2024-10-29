import 'message.dart';
import 'object.dart';
import 'package:flutter/material.dart';

class ChatContentUI extends StatelessWidget {
  final List<ChatMessage> messages;
  const ChatContentUI({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        messages.length,
        (index) => ChatMessageUI(
          message: messages[index],
        ),
      ),
    );
  }
}
