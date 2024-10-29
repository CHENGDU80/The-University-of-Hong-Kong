import 'package:flutter/material.dart';

class ChatBar extends StatelessWidget {
  const ChatBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(120), border: Border.all()),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 8),
          Icon(Icons.file_upload_outlined),
          SizedBox(width: 8),
          Expanded(
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Type a message', border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.send_outlined),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
