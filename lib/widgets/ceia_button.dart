import 'package:flutter/material.dart';

class CEIAButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final bool isLoading;

  const CEIAButton({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.onPressed,
    this.isLoading = false,
    this.color,
    this.textColor,
  });

  const CEIAButton.large({
    super.key,
    required this.text,
    this.height,
    this.onPressed,
    this.isLoading = false,
    this.color,
    this.textColor,
  }) : width = double.infinity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: color ?? const Color(0xff00478F),
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: textColor ?? Colors.white,
                ),
              )
            : Text(
                text,
                style: TextStyle(color: textColor ?? Colors.white, fontSize: 18),
              ),
      ),
    );
  }
}
