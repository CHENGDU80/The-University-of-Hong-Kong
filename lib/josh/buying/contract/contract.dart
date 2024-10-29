import 'package:chengdu80_prototype/josh/buying/contract/content/content.dart';
import 'package:chengdu80_prototype/josh/buying/contract/recommendation/recommendation.dart';
import 'package:flutter/material.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Row(
        children: [
          Flexible(flex: 3, child: RecommendationUI()),
          Flexible(flex: 4, child: ContractContent()),
        ],
      ),
    );
  }
}
