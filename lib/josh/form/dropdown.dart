import 'package:chengdu80_prototype/josh/form/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormDropDown extends StatelessWidget {
  final String title;
  final List<String> data;
  const FormDropDown(this.title, this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.read<FormProv>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownMenu<String>(
        width: 240,
        enableSearch: true,
        menuHeight: 200,
        hintText: title,
        onSelected: (value) {
          if (value == null) return;
          prov.formValue[title] = value;
        },
        dropdownMenuEntries: List.generate(
          data.length,
          (index) {
            return DropdownMenuEntry(
              value: data[index],
              label: data[index],
            );
          },
        ),
      ),
    );
  }
}
