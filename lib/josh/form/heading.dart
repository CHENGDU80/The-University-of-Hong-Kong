import 'package:chengdu80_prototype/color.dart';
import 'package:flutter/material.dart';

class FormHeading extends StatelessWidget {
  final String title;
  const FormHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: MyColors.secondary),
      ),
    );
  }
}
