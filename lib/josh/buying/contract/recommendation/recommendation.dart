import 'package:chengdu80_prototype/color.dart';
import 'package:chengdu80_prototype/josh/form/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecommendationUI extends StatelessWidget {
  const RecommendationUI({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<FormProv>();
    return ListView(
      children: [
        const SizedBox(height: 24),
        const Center(
          child: Text(
            'Recommended Changes',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: MyColors.primary,
            ),
          ),
        ),
        ...prov.recommendation,
      ],
    );
  }
}
