import 'package:chengdu80_prototype/color.dart';
import 'package:chengdu80_prototype/common/function/context/navigator.dart';
import 'package:chengdu80_prototype/common/page/load/function.dart';
import 'package:chengdu80_prototype/josh/buying/contract/contract.dart';
import 'package:chengdu80_prototype/josh/data/brand.dart';
import 'package:chengdu80_prototype/josh/data/car.dart';
import 'package:chengdu80_prototype/josh/data/claim_history.dart';
import 'package:chengdu80_prototype/josh/data/country.dart';
import 'package:chengdu80_prototype/josh/data/general.dart';
import 'package:chengdu80_prototype/josh/data/model.dart';
import 'package:chengdu80_prototype/josh/form/dropdown.dart';
import 'package:chengdu80_prototype/josh/form/heading.dart';
import 'package:chengdu80_prototype/josh/form/textbox.dart';
import 'package:chengdu80_prototype/josh/form/textfield.dart';
import 'package:chengdu80_prototype/josh/form/topbar.dart';
import 'package:flutter/material.dart';

final class BuyingUI extends StatelessWidget {
  const BuyingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.primary,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            const BuyingTopBar('Buy Car Insurance'),
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: MyColors.background,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const FormHeading(title: 'General Information'),
                  const MyTextField('Name', prefill: name),
                  const MyTextField('Address', prefill: address),
                  const MyTextField('Date of Birth', prefill: birthday),
                  const MyTextField('Occupation', prefill: occupation),
                  const MyTextField('Email', prefill: email),
                  const MyTextField('Phone Number', prefill: phoneNumber),
                  // car
                  const FormHeading(title: 'Car Information'),
                  const FormDropDown('Brand', carBrands),
                  const FormDropDown('Model', brandModels),
                  const FormDropDown('Region of Registration', countries),
                  const MyTextField('Vehicle Identification Number',
                      prefill: vin),
                  const MyTextField('Mileage', prefill: mileage),
                  const MyTextField('Year of Manufacture', prefill: carYear),
                  //
                  const FormHeading(title: 'History of Driving'),
                  const MyTextField('Year of Driving', prefill: '4'),
                  const MyTextBox('Previous Claims', prefill: claimHistory),
                  const MyTextBox('Traffic Violations', prefill: 'None'),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () async {
                        showLoading(context, 'Generating Contract...');
                        await Future.wait(
                          [
                            Future.delayed(const Duration(seconds: 2)),
                          ],
                        );
                        if (!context.mounted) return;
                        hideLoading(context);
                        pushPage(context, const ContractPage());
                      },
                      child: const Text("Submit"),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
