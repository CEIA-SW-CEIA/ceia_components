import 'package:flutter/material.dart';

class CEIASearchBar extends StatelessWidget {
  final String hint;
  final Color? backgroundColor;
  final Function(String)? onChanged;

  const CEIASearchBar({super.key, required this.hint, this.backgroundColor, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25, right: 16, top: 10, bottom: 10),
            child: Icon(
              Icons.search,
              color: Color(0xff949CB2),
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: (value) => onChanged?.call(value),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: Color(0xff949CB2),
                ),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
