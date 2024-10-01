import 'package:ceia_components/widgets/ceia_text.dart';
import 'package:flutter/material.dart';

class CEIAFilterButton extends StatelessWidget {
  final Function()? onPressed;

  const CEIAFilterButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 155,
        height: 52,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.filter_list,
              color: Color(0xff949CB2),
              size: 28,
            ),
            CEIAText.subtitleLarge(text: 'Filtros'),
          ],
        ),
      ),
    );
  }
}
