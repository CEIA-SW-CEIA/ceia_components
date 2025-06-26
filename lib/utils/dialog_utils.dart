import 'package:ceia_components/widgets/ceia_pop_up.dart';
import 'package:ceia_components/widgets/ceia_text.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  DialogUtils._();

  ///Constroi o pop-up de alerta, o paramêtro [message] representa a mensagem que
  ///será exibida para o usuário, o paramêtro  [barrierDismissible] determina se o
  ///clique fora da tela fecha ou não o pop-up
  static Future showInformativeAlertDialog(BuildContext context, String message, {bool barrierDismissible = true}) {
    return _showDialog(
      context,
      barrierDismissible: barrierDismissible,
      CeiaPopUp.alert(
        message: message,
        action: null,
      ),
    );
  }

  ///Constroi o pop-up de sucesso, o paramêtro [message] representa a mensagem que
  ///será exibida para o usuário,o paramêtro  [barrierDismissible] determina se o
  ///clique fora da tela fecha ou não o pop-up
  static Future showInformativeSuccessDialog(BuildContext context, String message, {bool barrierDismissible = true}) {
    return _showDialog(
      context,
      barrierDismissible: barrierDismissible,
      CeiaPopUp.sucess(
        message: message,
        action: null,
      ),
    );
  }

  ///Constroi o pop-up de erro, o paramêtro [message] representa a mensagem que
  ///será exibida para o usuário,o paramêtro  [barrierDismissible] determina se o
  ///clique fora da tela fecha ou não o pop-up
  static Future showInformativeErrorDialog(BuildContext context, String message, {bool barrierDismissible = true}) {
    return _showDialog(
      context,
      barrierDismissible: barrierDismissible,
      CeiaPopUp.error(
        message: message,
        action: null,
      ),
    );
  }

  ///Constroi o pop-up de informação, o paramêtro [message] representa a mensagem que
  ///será exibida para o usuário,o paramêtro  [barrierDismissible] determina se o
  ///clique fora da tela fecha ou não o pop-up
  static Future showInformativeInformation(BuildContext context, String message, {bool barrierDismissible = true}) {
    return _showDialog(
      context,
      barrierDismissible: barrierDismissible,
      CeiaPopUp.information(
        message: message,
        action: null,
      ),
    );
  }

  ///Constroi o pop-up de dúvida, o paramêtro [message] representa a mensagem que
  ///será exibida para o usuário,o paramêtro  [barrierDismissible] determina se o
  ///clique fora da tela fecha ou não o pop-up
  static Future showInformativeDoubt(BuildContext context, String message, {bool barrierDismissible = true}) {
    return _showDialog(
      context,
      barrierDismissible: barrierDismissible,
      CeiaPopUp.doubt(
        message: message,
        action: null,
      ),
    );
  }

  ///Constroi o pop-up de confirmação, o paramêtro [message] representa a mensagem que
  ///será exibida para o usuário, o paramêtro [confirm] é a função que será executada
  ///quando o usuário clica em confirmar,o paramêtro  [barrierDismissible] determina se o
  ///clique fora da tela fecha ou não o pop-up
  static Future showConfirmDialog(BuildContext context, String message, Function() confirm,
      {bool barrierDismissible = true}) {
    return _showDialog(
      context,
      barrierDismissible: barrierDismissible,
      CeiaPopUp.confirm(
        message: message,
        action: confirm,
      ),
    );
  }

  //Constroi a estrutura do pop-up
  static Future _showDialog(BuildContext context, Widget popUp, {bool barrierDismissible = true}) {
    return showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => popUp,
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
