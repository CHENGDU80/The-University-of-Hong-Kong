import 'package:chengdu80_prototype/josh/form/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyTextBox extends StatefulWidget {
  final String title;
  final String prefill;
  const MyTextBox(this.title, {super.key, this.prefill = ""});

  @override
  State<MyTextBox> createState() => _MyTextBoxState();
}

class _MyTextBoxState extends State<MyTextBox> {
  final controller = TextEditingController();
  late final FormProv prov;

  @override
  void initState() {
    super.initState();
    controller.text = widget.prefill;
    prov = context.read<FormProv>();
    prov.textControllers[widget.title] = controller;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        maxLines: null,
        decoration: InputDecoration(
          labelText: widget.title,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
