import 'package:flutter/material.dart';

class CEIATextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool readOnly;

  const CEIATextField({super.key, this.label, this.hint, this.controller, this.readOnly = false});

  const CEIATextField.readOnly({super.key, this.label, this.hint, this.controller}) : readOnly = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        focusColor: const Color(0xff00478F),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Colors.black.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
