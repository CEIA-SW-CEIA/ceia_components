import 'package:flutter/material.dart';

class CEIALinearProgressBar extends StatelessWidget {
  const CEIALinearProgressBar({super.key, this.currentValue});

  final double? currentValue;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: const Color(0xff75D390),
      backgroundColor: const Color(0xffF3F4F8),
      value: currentValue,
      minHeight: 5,
    );
  }
}
