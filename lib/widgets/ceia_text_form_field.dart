import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CEIATextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? helperText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final int? minLines;
  final int? maxLines;
  final TextInputFormatter? inputMask;
  final bool? alignLabelWithHint;
  final Widget? suffixIcon;
  final FormFieldValidator? validator;
  final TextInputAction? inputAction;
  final Function(String)? onFieldSubmitted;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;

  const CEIATextFormField({
    super.key,
    this.label,
    this.hint,
    this.helperText = '',
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.errorText,
    this.minLines,
    this.maxLines,
    this.inputMask,
    this.alignLabelWithHint,
    this.suffixIcon,
    this.validator,
    this.inputAction,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      minLines: minLines,
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      textInputAction: inputAction,
      readOnly: readOnly,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: alignLabelWithHint,
        helperText: helperText,
        hintText: hint,
        focusColor: const Color(0xff00478F),
        errorText: errorText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Colors.black.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      inputFormatters: inputMask != null ? [inputMask!] : null,
    );
  }
}
