import 'package:ceia_components/widgets/ceia_text.dart';
import 'package:flutter/material.dart';

class CEIACheckbox extends StatelessWidget {
  const CEIACheckbox({
    super.key,
    required this.actualValue,
    required this.label,
    required this.onChanged,
    this.enabled = true,
  });

  final bool actualValue;
  final String label;
  final Function(bool? value) onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: actualValue,
          onChanged: enabled ? onChanged : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        CEIAText.subtitleMedium(
          text: label,
          color: enabled ? null : const Color(0xFF949CB2),
        ),
      ],
    );
  }
}
