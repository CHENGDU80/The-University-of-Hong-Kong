import 'package:chengdu80_prototype/color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HyperLink extends StatelessWidget {
  final String url;
  final String text;
  final IconData icon;
  const HyperLink(
      {super.key, required this.url, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Column(
        children: [
          Row(children: [
            Icon(
              icon,
              color: MyColors.primary,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                  decoration: TextDecoration.underline,
                  color: MyColors.primary),
            ),
          ]),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
