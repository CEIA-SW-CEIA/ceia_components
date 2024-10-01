import 'package:flutter/material.dart';

class CEIAIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final double? width;
  final double? height;
  final Function()? onPressed;
  final double? fontSize;
  final Color? color;
  final Color? textColor;

  const CEIAIconButton(
      {super.key,
      required this.icon,
      required this.text,
      this.iconColor,
      this.width,
      this.height,
      this.onPressed,
      this.color,
      this.fontSize,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 50,
      child: ElevatedButton.icon(
        icon: Icon(icon, color: iconColor ?? Colors.white),
        onPressed: onPressed,
        label: Text(
          text,
          style: TextStyle(color: textColor ?? Colors.white, fontSize: fontSize ?? 18),
        ),
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: color ?? const Color(0xff00478F),
        ),
      ),
    );
  }
}
