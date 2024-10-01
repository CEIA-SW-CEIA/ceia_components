// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CEIASimpleTextField extends StatelessWidget {
  const CEIASimpleTextField({super.key, this.hint, this.controller, this.suffixIcon, this.multiline = false});

  final String? hint;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool multiline;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: multiline ? null : 1,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat',
          color: Color(0xff949CB2),
        ),
        filled: true,
        fillColor: const Color(0xffEBEBEB),
        suffixIcon: suffixIcon,
        border: InputBorder.none,
      ),
    );
  }
}
