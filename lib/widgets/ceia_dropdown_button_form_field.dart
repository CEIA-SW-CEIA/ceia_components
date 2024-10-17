import 'package:flutter/material.dart';

class CEIADropdownButtonFormField extends StatelessWidget {
  const CEIADropdownButtonFormField({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.label,
    this.enabled = true,
    this.validator,
    this.helperText,
  });

  const CEIADropdownButtonFormField.space({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.label,
    this.enabled = true,
    this.validator,
    this.helperText = '',
  });

  final List<DropdownMenuItem<String>> items;
  final String label;
  final String? value;
  final Function(String? value) onChanged;
  final String? Function(String? value)? validator;
  final bool enabled;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        helperText: helperText,
        labelText: label,
        enabled: enabled,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Colors.black.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      items: items,
      value: value,
      onChanged: enabled ? onChanged : null,
      validator: validator,
    );
  }
}
