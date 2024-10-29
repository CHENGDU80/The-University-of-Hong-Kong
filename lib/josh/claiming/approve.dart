import 'package:chengdu80_prototype/josh/form/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApproveUI extends StatelessWidget {
  const ApproveUI({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.read<FormProv>();
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/claim/approved.png', height: 400),
          const SizedBox(height: 30),
          Text(
            'Approved Amount: \$${prov.claimAmount}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
