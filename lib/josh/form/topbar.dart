import 'package:flutter/material.dart';

class BuyingTopBar extends StatelessWidget {
  final String title;
  const BuyingTopBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(title,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 32,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset('assets/avatar/shah.png'),
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}
