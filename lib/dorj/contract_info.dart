import 'package:flutter/material.dart';

class ContInfo extends StatelessWidget {
  final String title;
  final String text;
  const ContInfo(this.title, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title: ',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          text,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
