import 'package:chengdu80_prototype/josh/form/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyTextField extends StatefulWidget {
  final String title;
  final String prefill;
  const MyTextField(this.title, {super.key, this.prefill = ""});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
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
        decoration: InputDecoration(
          labelText: widget.title,
        ),
      ),
    );
  }
}
