import 'package:ceia_components/widgets/ceia_button.dart';
import 'package:ceia_components/widgets/ceia_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogUtils {
  DialogUtils._();

  static Future showInformativeSuccessDialog(BuildContext context, String message) {
    return _showDialog(
      context,
      'Sucesso!',
      message,
      [
        CEIAButton.large(
          onPressed: () => Navigator.pop(context),
          text: 'Ok',
          height: 45,
        )
      ],
    );
  }

  static Future showInformativeErrorDialog(BuildContext context, String message, {bool barrierDismissible = true}) {
    return _showDialog(
      context,
      'Ops!',
      message,
      [
        CEIAButton.large(
          onPressed: () => Navigator.pop(context),
          text: 'Ok',
          height: 45,
        )
      ],
      barrierDismissible: barrierDismissible,
    );
  }

  static showConfirmDialog({
    required BuildContext context,
    required String title,
    required String message,
    required Function() onConfirm,
  }) {
    return _showDialog(
      context,
      title,
      message,
      [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CEIAButton(
              onPressed: () => Navigator.pop(context),
              color: const Color(0xff949CB2),
              text: 'Cancelar',
              height: 45,
            ),
            const SizedBox(width: 16),
            CEIAButton(
              onPressed: () {
                onConfirm();
                context.pop();
              },
              text: 'Continuar',
              height: 45,
            ),
          ],
        )
      ],
    );
  }

  static Future _showDialog(BuildContext context, String title, String message, List<Widget>? actions,
      {bool barrierDismissible = true}) {
    return showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Center(
            child: Column(
          children: [
            Text(title),
            const Divider(),
          ],
        )),
        content: Container(
          constraints: const BoxConstraints(maxWidth: 650, maxHeight: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
            child: CEIAText.bodyLarge(text: message),
          ),
        ),
        actions: actions,
      ),
    );
  }

  static showBottomMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[300],
        content: Center(
          child: CEIAText.bodyLarge(text: message),
        ),
      ),
    );
  }

  static Future<T?> showPopUp<T>(BuildContext context, Widget? widget) {
    return showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        content: widget,
      ),
    );
  }
}
