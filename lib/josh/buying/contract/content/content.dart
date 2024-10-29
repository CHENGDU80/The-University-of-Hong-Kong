import 'package:chengdu80_prototype/color.dart';
import 'package:chengdu80_prototype/common/function/context/navigator.dart';
import 'package:chengdu80_prototype/common/page/load/function.dart';
import 'package:chengdu80_prototype/josh/buying/contract/content/items/heading.dart';
import 'package:chengdu80_prototype/josh/buying/contract/content/items/info.dart';
import 'package:chengdu80_prototype/josh/buying/contract/content/successful.dart';
import 'package:chengdu80_prototype/josh/form/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContractContent extends StatelessWidget {
  const ContractContent({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<FormProv>();
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.amber[50],
          borderRadius: BorderRadius.circular(60),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Row(
                children: [
                  Spacer(),
                  Text(
                    'Car Insurance Policy',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: MyColors.primary,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              ContractInfoText('Policy Number', prov.policyNumber),
              ContractInfoText('Effective Date', prov.effectiveDate),
              ContractInfoText('Expiration Date', prov.expiredDate),
              //
              const ContractHeading(title: 'Insured Party'),
              ContractInfoText(
                  'Name', prov.textControllers['Name']?.text ?? ''),
              ContractInfoText(
                  'Address', prov.textControllers['Address']?.text ?? ''),
              ContractInfoText('Phone Number',
                  prov.textControllers['Phone Number']?.text ?? ''),
              ContractInfoText(
                  'Email', prov.textControllers['Email']?.text ?? ''),
              //
              const ContractHeading(title: 'Vehicle Information'),
              ContractInfoText('Brand', prov.formValue['Brand'] ?? ''),
              ContractInfoText('Model', prov.formValue['Model'] ?? ''),
              ContractInfoText('Year of Manufature',
                  prov.textControllers['Year of Manufature']?.text ?? ''),
              ContractInfoText(
                  'VIN',
                  prov.textControllers['Vehicle Identification Number']?.text ??
                      ''),
              ContractInfoText(
                  'Mileage', prov.textControllers['Mileage']?.text ?? ''),
              //
              const ContractHeading(title: 'Coverage'),
              ContractInfoText(
                'Bodily Injury Liability',
                '\$${prov.body} per person',
                changed: prov.bodyChanged,
              ),
              ContractInfoText(
                  'Property Damage Liability', '\$${prov.property}',
                  changed: prov.propertyChanged),
              ContractInfoText(
                  'Collision Coverage', '\$${prov.collision} deductible',
                  changed: prov.collisionChanged),
              ContractInfoText('Comprehensive Coverage',
                  '\$${prov.comprehensive} deductible',
                  changed: prov.comprehensiveChanged),
              ContractInfoText(
                'Uninsured/Underinsured Motorist Coverage',
                '\$${prov.motorist} per person',
                changed: prov.motoristChanged,
              ),
              //
              const ContractHeading(title: 'Terms and Conditions'),
              const ContractInfoText(
                  '1', 'Coverage limits apply as stated above.'),
              const ContractInfoText('2',
                  'Premiums are due on the first of each month. Late payments may incur fees.'),
              const ContractInfoText('3',
                  'The insured must notify the insurer of any changes to vehicle ownership or address.'),
              const ContractInfoText('4',
                  'In the event of a claim, the insured must report the incident within 30 days.'),
              //
              const ContractHeading(title: 'Cancellation Policy'),
              const ContractInfoText('1',
                  'The insured may cancel this policy at any time by providing written notice to the insurer.'),
              const ContractInfoText('2',
                  'The insurer reserves the right to cancel the policy for non-payment or fraudulent activity.'),
              //
              const ContractHeading(title: 'Premium'),
              ContractInfoText(
                'Monthly Premium',
                '\$${prov.premium}',
                changed: prov.premiumChanged,
              ),
              //
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: ElevatedButton(
                      onPressed: () async {
                        showLoading(context, 'Processing your application...');
                        await prov.submitBuy();
                        if (!context.mounted) return;
                        hideLoading(context);
                        pushPage(context, const ContractSuccessPage());
                      },
                      child: const Text('Confirm')),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
