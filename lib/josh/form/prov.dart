import 'dart:math';

import 'package:chengdu80_prototype/josh/buying/contract/recommendation/tile.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FormProv extends ChangeNotifier {
  final textControllers = <String, TextEditingController>{};
  final formValue = <String, String>{};
  final random = Random();

  // contract
  late final String policyNumber;
  String effectiveDate = 'October 31, 2024';
  String expiredDate = 'October 31, 2025';
  // coverage
  int body = 200000;
  int property = 50000;
  int collision = 2000;
  int comprehensive = 2000;
  int motorist = 100000;
  bool bodyChanged = false;
  bool propertyChanged = false;
  bool collisionChanged = false;
  bool comprehensiveChanged = false;
  bool motoristChanged = false;
  // premium
  int premium = 400;
  bool premiumChanged = false;

  int claimAmount = 100000;

  FormProv() {
    policyNumber = random.nextInt(99999999).toString();
    premium += random.nextInt(400);
  }

  final recommendation = [
    const RecommendationTile('Increase Injury Liability by \$50000', 40),
    const RecommendationTile(
        'Increase Property Damage Liability by \$4000', 30),
    const RecommendationTile('Increase Collision Coverage by \$500', 10),
    const RecommendationTile('Increase Comprehensive Coverage by \$500', 10),
    const RecommendationTile('Increase Motorist Coverage by \$50000', 35),
    const RecommendationTile('Decrease Injury Liability by \$50000', -40),
    const RecommendationTile(
        'Decrease Property Damage Liability by \$4000', -30),
    const RecommendationTile('Decrease Collision Coverage by \$500', -10),
    const RecommendationTile('Decrease Comprehensive Coverage by \$500', -10),
    const RecommendationTile('Decrease Motorist Coverage by \$50000', -35),
  ];

  void applyRecommendation(RecommendationTile tile) {
    premiumChanged = true;
    if (tile.text.contains('Increase')) {
      if (tile.text.contains('Injury')) {
        body += 50000;
        bodyChanged = true;
      } else if (tile.text.contains('Property')) {
        property += 4000;
        propertyChanged = true;
      } else if (tile.text.contains('Collision')) {
        collision += 500;
        collisionChanged = true;
      } else if (tile.text.contains('Comprehensive')) {
        comprehensive += 500;
        comprehensiveChanged = true;
      } else if (tile.text.contains('Motorist')) {
        motorist += 50000;
        motoristChanged = true;
      }
    } else {
      if (tile.text.contains('Injury')) {
        body -= 50000;
        bodyChanged = true;
      } else if (tile.text.contains('Property')) {
        property -= 4000;
        propertyChanged = true;
      } else if (tile.text.contains('Collision')) {
        collision -= 500;
        collisionChanged = true;
      } else if (tile.text.contains('Comprehensive')) {
        comprehensive -= 500;
        comprehensiveChanged = true;
      } else if (tile.text.contains('Motorist')) {
        motorist -= 50000;
        motoristChanged = true;
      }
    }

    premium += tile.priceDelta;
    recommendation.remove(tile);
    notifyListeners();
  }

  Future<void> submitBuy() async {
    final supabase = Supabase.instance.client;
    await supabase.from('underwrite').insert({
      'name': textControllers['Name']?.text ?? '',
      'address': textControllers['Address']?.text ?? '',
      'birth': textControllers['Date of Birth']?.text ?? '',
      'occupation': textControllers['Occupation']?.text ?? '',
      'email': textControllers['Email']?.text ?? '',
      'phone': textControllers['Phone Number']?.text ?? '',
      'brand': formValue['Brand'] ?? '',
      'model': formValue['Model'] ?? '',
      'vin': textControllers['Vehicle Identification Number']?.text ?? '',
      'mile': textControllers['Mileage']?.text ?? '',
      'year_manufactor': textControllers['Year of Manufacture']?.text ?? '',
      'history_drive': textControllers['Year of Driving']?.text ?? '',
      'prev_claims': textControllers['Previous Claims']?.text ?? '',
      'violation': textControllers['Traffic Violations']?.text ?? '',
      'image': 'qinplus.png',
      'amount': premium,
      'expiry': expiredDate,
      'issued': effectiveDate,
      'description': '',
      'document': '',
    });
  }

  Future<void> submitClaim(bool approved) async {
    final reqAmount = int.parse(textControllers['Amount']!.text.split(' ')[1]);
    if (!approved) {
      claimAmount = int.parse(textControllers['Amount']!.text.split(' ')[1]) -
          random.nextInt(1000);
    } else {
      claimAmount = reqAmount;
    }
    final supabase = Supabase.instance.client;
    await supabase.from('claim').insert({
      'title': title[random.nextInt(title.length)],
      'req_amount': reqAmount.toString(),
      'rem_amount': claimAmount.toString(),
      'description': textControllers['Description']?.text ?? '',
      'contact': textControllers['Phone Number']?.text ?? '',
      'confidence': random.nextInt(30) + 70,
      'approved': approved,
      'human_inter': approved ? false : random.nextBool(),
      'link_data': '',
      'link_contract': '',
      'image': 'qinplus.png',
      'name': textControllers['Name']?.text ?? '',
      'age': 20 + random.nextInt(20),
      'support': '',
      'brand': formValue['Brand'] ?? '',
      'model': formValue['Model'] ?? '',
      'location': textControllers['Location']?.text ?? '',
    });
  }
}

const title = [
  "Car Crash",
  "Theft or Vandalism",
  "Hit and Run",
  "Weather-Related Damage",
  "Fire Damage",
  "Animal Collision",
  "Liability Claims",
  "Personal Injury Claims",
  "Property Damage Claims",
  "Glass Breakage",
  "Total Loss Claims",
  "Collision Claims",
  "Roadside Assistance Claims",
  "Rental Car Reimbursement Claims",
  "Uninsured Motorist Claims"
];
