import 'package:flutter/material.dart';

class CEIAScaffold extends StatelessWidget {
  const CEIAScaffold({
    super.key,
    required this.body,
    this.onLeftLogoPressed,
    this.leftMenu,
    this.onRightButtonPressed,
  });

  final Widget body;
  final Widget? leftMenu;

  final Function()? onLeftLogoPressed;
  final Function()? onRightButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff083A75),
        leading: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: GestureDetector(
            onTap: () => onLeftLogoPressed?.call(),
            child: Image.asset('packages/ceia_components/image/ceia_logo_icon.png'),
          ),
        ),
        leadingWidth: 200,
        toolbarHeight: 70,
        actions: onRightButtonPressed != null
            ? [
                IconButton(
                  iconSize: 35,
                  padding: const EdgeInsets.all(10.0),
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                  onPressed: () => onRightButtonPressed?.call(),
                ),
                const SizedBox(width: 30),
              ]
            : null,
      ),
      body: Builder(builder: (context) {
        if (leftMenu != null) {
          return Row(
            children: [leftMenu!, Expanded(child: body)],
          );
        }

        return body;
      }),
    );
  }
}
