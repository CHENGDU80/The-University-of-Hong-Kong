import 'dart:math';

import 'package:flutter/material.dart';

final reasons = [
  "Policy Lapse: The insurance policy was not active at the time of the incident.",
  "Coverage Exclusions: The incident is not covered under the terms of the policy.",
  "Fraudulent Claim: The claim was found to be fraudulent or exaggerated.",
  "Insufficient Evidence: There was not enough evidence to support the claim.",
  "Failure to Report: The incident was not reported to the insurer within the required timeframe.",
  "Unauthorized Driver: The vehicle was being driven by someone not authorized under the policy.",
  "Pre-existing Damage: The damage existed prior to the incident and was not caused by the reported event.",
  "Non-compliance with Policy Terms: The claimant failed to comply with specific policy conditions.",
  "Driving Under Influence: The driver was under the influence of drugs or alcohol at the time of the incident.",
  "Unlicensed Driver: The driver did not have a valid driver's license at the time of the incident."
];

class DenyUI extends StatelessWidget {
  const DenyUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/claim/deny.png'),
          const SizedBox(height: 30),
          Text(
            reasons[Random().nextInt(reasons.length)],
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
