import 'package:ceia_components/widgets/ceia_button_new.dart';
import 'package:ceia_components/widgets/ceia_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CeiaPopUp extends StatelessWidget {
  final String imagePath;
  final String title;
  final String message;
  final Function()? action;

  ///Pop up de alerta, o paramêtro [message] recebe qual mensagem vai aparecer no pop-up
  const CeiaPopUp.alert({
    super.key,
    this.imagePath = "packages/ceia_components/image/ceia_alert_image.png",
    this.title = 'Alerta!',
    required this.message,
    this.action,
  });

  ///Pop up de confirmação, o paramêtro [message] recebe qual mensagem vai aparecer no pop-up
  const CeiaPopUp.sucess({
    super.key,
    this.imagePath = "packages/ceia_components/image/ceia_confirmation_image.png",
    this.title = 'Confirmação!',
    required this.message,
    this.action,
  });

  ///Pop up de erro, o paramêtro [message] recebe qual mensagem vai aparecer no pop-up
  const CeiaPopUp.error({
    super.key,
    this.imagePath = "packages/ceia_components/image/ceia_error_image.png",
    this.title = 'Erro!',
    required this.message,
    this.action,
  });

  ///Pop up de informação, o paramêtro [message] recebe qual mensagem vai aparecer no pop-up
  const CeiaPopUp.information({
    super.key,
    this.imagePath = "packages/ceia_components/image/ceia_info_image.png",
    this.title = 'Informação!',
    required this.message,
    this.action,
  });

  ///Pop up de dúvida, o paramêtro [message] recebe qual mensagem vai aparecer no pop-up
  const CeiaPopUp.doubt({
    super.key,
    this.imagePath = "packages/ceia_components/image/ceia_doubt_image.png",
    this.title = 'Dúvida!',
    required this.message,
    this.action,
  });

  ///Pop up de questão, o paramêtro [message] recebe qual mensagem vai aparecer no pop-up
  ///o paramêtro [action] diz qual ação será realizada pelo pop-up antes de fechar
  const CeiaPopUp.confirm({
    super.key,
    this.imagePath = "packages/ceia_components/image/ceia_issue_image.png",
    this.title = 'Questão!',
    required this.message,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
            _buildActions(action, context)
          ],
        ),
      ),
    );
  }

  //Constroi o conteúdo principal de pop-up
  Widget _buildImageAndText(String imagePath, String title, String message) {
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
            SizedBox(
              height: 40,
              width: 190,
              child: Flexible(
                child: CEIAText.bodyLarge(
                  text: message,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  //Constroi o botão de fechar
  Widget _buildCloseButton(BuildContext context) {
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

  //Constroi os botões com as ações do pop-up
  Widget _buildActions(Function()? action, BuildContext context) {
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
}
