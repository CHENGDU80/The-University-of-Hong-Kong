import 'package:chengdu80_prototype/color.dart';
import 'package:flutter/material.dart';

class ContractHeading extends StatelessWidget {
  final String title;
  const ContractHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
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
