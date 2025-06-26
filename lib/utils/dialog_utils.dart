
import 'package:ceia_components/widgets/ceia_button_new.dart';
import 'package:ceia_components/widgets/ceia_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogUtils {
  DialogUtils._();

  ///Constroi o pop-up de alerta, o paramêtro [message] representa a mensagem que
  ///será exibida para o usuário
  static Future showInformativeAlertDialog(BuildContext context, String message) {
    return _showDialog(
      context,
      "ceia_components/image/ceia_alert_image.png",
      'Alerta!',
      message,
      _buildActions(null, context),
    );
  }

  ///Constroi o pop-up de sucesso, o paramêtro [message] representa a mensagem que
  ///será exibida para o usuário
  static Future showInformativeSuccessDialog(BuildContext context, String message) {
    return _showDialog(
      context,
      "ceia_components/image/ceia_confirmation_image.png",
      'Confirmação!',
      message,
      _buildActions(null, context),
    );
  }

  ///Constroi o pop-up de erro, o paramêtro [message] representa a mensagem que
  ///será exibida para o usuário
  static Future showInformativeErrorDialog(BuildContext context, String message, {bool barrierDismissible = true}) {
    return _showDialog(
      context,
      "ceia_components/image/ceia_error_image.png",
      'Erro!',
      message,
      _buildActions(null, context),
      barrierDismissible: barrierDismissible,
    );
  }

  ///Constroi o pop-up de informação, o paramêtro [message] representa a mensagem que
  ///será exibida para o usuário
  static Future showInformativeInformation(BuildContext context, String message, {bool barrierDismissible = true}) {
    return _showDialog(
      context,
      "ceia_components/image/ceia_info_image.png",
      'Informação!',
      message,
      _buildActions(null, context),
      barrierDismissible: barrierDismissible,
    );
  }

  ///Constroi o pop-up de dúvida, o paramêtro [message] representa a mensagem que
  ///será exibida para o usuário
  static Future showInformativeDoubt(BuildContext context, String message, {bool barrierDismissible = true}) {
    return _showDialog(
      context,
      "ceia_components/image/ceia_doubt_image.png",
      'Dúvida',
      message,
      _buildActions(null, context),
      barrierDismissible: barrierDismissible,
    );
  }

  ///Constroi o pop-up de confirmação, o paramêtro [message] representa a mensagem que
  ///será exibida para o usuário, o paramêtro [confirm] é a função que será executada
  ///quando o usuário clica em confirmar
  static Future showConfirmDialog(BuildContext context, String message, Function() confirm,
      {bool barrierDismissible = true}) {
    return _showDialog(
      context,
      "ceia_components/image/ceia_issue_image.png",
      'Questão',
      message,
      _buildActions(confirm, context),
      barrierDismissible: barrierDismissible,
    );
  }

  //Constroi a estrutura do pop-up
  static Future _showDialog(BuildContext context, String imagePath, String title, String message, Widget actions,
      {bool barrierDismissible = true}) {
    return showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: 320,
          height: 174,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Botão de fechar
              _buildCloseButton(context),
              //Sessão que contem a imagem, o título e o texto do pop-up
              _buildImageAndText(imagePath, title, message),
              const SizedBox(
                height: 16,
              ),
              //Botões presentes na parte inferior do pop-up
              actions
            ],
          ),
        ),
      ),
    );
  }

  //Constroi o conteúdo principal de pop-up
  static Widget _buildImageAndText(String imagePath, String title, String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 24,
        ),
        Image.asset(
          imagePath,
          width: 58,
          height: 58,
        ),
        const SizedBox(
          width: 17,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CEIAText.titleSmall(text: title),
            const SizedBox(
              height: 8,
            ),
            CEIAText.bodyLarge(
              text: message,
            ),
          ],
        )
      ],
    );
  }

  static Widget _buildCloseButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.close,
            size: 14,
          ),
        )
      ],
    );
  }

  //Constroi os botões que estão presentes na parte inferior do pop-up
  static Widget _buildActions(Function()? action, BuildContext context) {
    if (action != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 54),
        child: Row(
          children: [
            CeiaButtonNew(
              borderColor: Colors.grey,
              textColor: Colors.grey,
              borderRadius: 5,
              color: Colors.white,
              onPressed: () {
                context.pop();
              },
              text: 'Não',
              width: 97,
              height: 26,
            ),
            const SizedBox(
              width: 16,
            ),
            CeiaButtonNew(
              borderRadius: 5,
              text: 'Sim',
              width: 97,
              height: 26,
              onPressed: () {
                action.call();
                context.pop();
              },
            ),
          ],
        ),
      );
    }
    return CeiaButtonNew(
      borderRadius: 5,
      text: 'Fechar',
      width: 97,
      height: 26,
      onPressed: () {
        context.pop();
      },
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
