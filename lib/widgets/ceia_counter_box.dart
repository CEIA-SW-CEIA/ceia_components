import 'package:ceia_components/widgets/ceia_text.dart';
import 'package:flutter/material.dart';

class CEIACounterBox extends StatelessWidget {
  const CEIACounterBox({
    super.key,
    this.value,
    this.height = 35,
    this.width = 35,
  });

  final double height;
  final double width;
  final int? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff949CB2), width: 3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: CEIAText.titleSmall(
          text: value != null ? value.toString() : '0',
          fontWeight: FontWeight.w600,
          color: const Color(0xff747474),
        ),
      ),
    );
  }
}
