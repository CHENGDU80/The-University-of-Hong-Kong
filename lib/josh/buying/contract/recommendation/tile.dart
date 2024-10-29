// ignore: unused_import
import 'package:chengdu80_prototype/josh/buying/contract/contract.dart';
import 'package:chengdu80_prototype/josh/form/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecommendationTile extends StatelessWidget {
  final String text;
  final int priceDelta;
  const RecommendationTile(this.text, this.priceDelta, {super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.read<FormProv>();
    return Column(
      children: [
        InkWell(
          onTap: () {
            prov.applyRecommendation(this);
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                  Text('Premium Change: $priceDelta per month'),
                  Text('New Premium: ${prov.premium + priceDelta} per month')
                ],
              ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
