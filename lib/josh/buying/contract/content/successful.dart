import 'package:flutter/material.dart';

class ContractSuccessPage extends StatelessWidget {
  const ContractSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/claim/approved.png', height: 400),
          const SizedBox(height: 30),
          const Text(
            'Your application has been approved automatically.',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
