import 'package:flutter/material.dart';

class ContractInfoText extends StatelessWidget {
  final String title;
  final String text;
  final bool changed;
  const ContractInfoText(this.title, this.text,
      {super.key, this.changed = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 24),
        Text(
          '$title: ',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16, color: changed ? Colors.blue : null),
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}
