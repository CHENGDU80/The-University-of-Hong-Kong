import 'package:chengdu80_prototype/color.dart';
import 'package:chengdu80_prototype/common/function/context/navigator.dart';
import 'package:chengdu80_prototype/common/page/load/function.dart';
import 'package:chengdu80_prototype/josh/claiming/approve.dart';
import 'package:chengdu80_prototype/josh/claiming/upload.dart';
import 'package:chengdu80_prototype/josh/data/car.dart';
import 'package:chengdu80_prototype/josh/data/general.dart';
import 'package:chengdu80_prototype/josh/data/incident.dart';
import 'package:chengdu80_prototype/josh/data/policy.dart';
import 'package:chengdu80_prototype/josh/form/dropdown.dart';
import 'package:chengdu80_prototype/josh/form/heading.dart';
import 'package:chengdu80_prototype/josh/form/prov.dart';
import 'package:chengdu80_prototype/josh/form/textbox.dart';
import 'package:chengdu80_prototype/josh/form/textfield.dart';
import 'package:chengdu80_prototype/josh/form/topbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final class ClaimingUI extends StatelessWidget {
  const ClaimingUI({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.read<FormProv>();
    return Material(
      color: MyColors.primary,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            const BuyingTopBar('Claim Insurance'),
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
                  // general
                  const MyTextField('Policy Number', prefill: policyNumber),
                  const MyTextField('Name', prefill: name),
                  const MyTextField('Email', prefill: email),
                  const MyTextField('Phone Number', prefill: phoneNumber),
                  // car
                  const FormHeading(title: 'Car Information'),
                  const FormDropDown(brand, []),
                  const FormDropDown(model, []),
                  const MyTextField('Year of Manufacture', prefill: '2018'),
                  const MyTextField('License Plate Number',
                      prefill: liscenceNumber),
                  const MyTextField('VIN', prefill: vin),
                  // incident
                  const FormHeading(title: 'Details of Incident'),
                  const MyTextField('Date', prefill: 'October 1, 2023'),
                  const MyTextField(
                    'Time',
                    prefill: '3:00 PM',
                  ),
                  const MyTextField('Location',
                      prefill:
                          'Ren Min Zhong Lu 202 hao Huang Tu Po Xin Yong She'),
                  const MyTextBox('Description', prefill: incidentDescription),
                  // upload
                  const FormHeading(title: 'Relevant Images/Videos/Documents'),
                  const SizedBox(height: 12),
                  const UploadUI(),
                  // claim
                  const FormHeading(title: 'Money requested'),
                  const MyTextField('Amount', prefill: '¥ 100000'),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () async {
                        showLoading(context, 'Uploading claim...');
                        // final r = Random().nextInt(10);
                        // await prov.submitClaim(r >= 2);
                        // await Future.delayed(const Duration(seconds: 2));
                        // if (!context.mounted) return;
                        // hideLoading(context);
                        // if (r < 2) {
                        //   pushPage(context, const DenyUI());
                        //   return;
                        // }
                        await Future.delayed(const Duration(seconds: 2));
                        await prov.submitClaim(true);
                        if (!context.mounted) return;
                        hideLoading(context);
                        pushPage(context, const ApproveUI());
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
