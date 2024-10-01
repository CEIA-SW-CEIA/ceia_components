import 'package:ceia_components/core/constant/colors.dart';
import 'package:ceia_components/widgets/ceia_text.dart';
import 'package:flutter/material.dart';

class CEIADropdown extends StatelessWidget {
  final String? label;
  final String? currentValue;
  final Iterable<String> items;
  final Function(String?)? onChanged;
  final String? hint;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;
  final bool enabled;

  const CEIADropdown({
    super.key,
    this.label,
    this.currentValue,
    required this.items,
    required this.onChanged,
    this.hint = 'Selecionar...',
    this.fillColor,
    this.validator,
    this.enabled = true,
  });

  // Método que retorna a estilização
  static InputDecoration buildInputDecoration(String? hint, Color? fillColor) {
    return InputDecoration(
      filled: true,
      fillColor: fillColor ?? Colors.transparent,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1.0,
          color: primaryBlue,
        ),
        borderRadius: BorderRadius.circular(2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2.0,
          color: primaryBlue,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      hintText: hint,
      hintStyle: CEIAText.bodyLarge(
        text: hint ?? 'Selecionar...',
        fontWeight: FontWeight.normal,
        color: subheadingColor,
      ).style,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null && label!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CEIAText.bodyLarge(
              text: label!,
              fontWeight: FontWeight.w600,
              color: subheadingColor,
            ),
          ),
        DropdownButtonFormField<String>(
          value: currentValue,
          decoration: buildInputDecoration(hint, Colors.transparent),
          dropdownColor: baseBackground,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: CEIAText.bodyLarge(
                text: value,
                color: subheadingColor,
              ),
            );
          }).toList(),
          onChanged: enabled ? onChanged : null,
          validator: validator ?? (value) => value?.isEmpty ?? true ? 'Campo obrigatório' : null,
        ),
      ],
    );
  }
}
