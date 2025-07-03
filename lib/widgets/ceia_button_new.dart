import 'package:flutter/material.dart';

class CeiaButtonNew extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final bool isLoading;
  final double? borderRadius;
  final double? fontSize;
  final Color? borderColor;

  const CeiaButtonNew({super.key,
    required this.text,
    this.borderRadius,
    this.width,
    this.height,
    this.onPressed,
    this.isLoading = false,
    this.color,
    this.textColor,
    this.borderColor,
    this.fontSize,});

   @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? const Color(0xFF205EA4),
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 10),
          ),
        ),
        width: width,
        height: height ?? 50,
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? 14,
                  ),
                ),
              ),
      ),
    );
  }
}