import 'package:ceia_components/widgets/ceia_button_new.dart';
import 'package:ceia_components/widgets/ceia_selectable_text.dart';
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
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 174,
          minWidth: 270,
          maxWidth: 320,
          maxHeight: 284,
        ),
        child: Stack(
          fit: StackFit.loose,
          children: [
            //Botão de fechar
            _buildCloseButton(context),
            //Conteúdo principal
            _buildMainContent(context),
          ],
        ),
      ),
    );
  }

  //Constroi o conteúdo principal: título, texto, botões de ação e ícone
  Widget _buildMainContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 40,
        ),
        //Sessão que contem a imagem, o título e o texto do pop-up
        _buildScrollableReponsiveRegion(
          _buildImageAndText(imagePath, title, message),
        ),
        const SizedBox(
          height: 10,
        ),
        //Botões presentes na parte inferior do pop-up
        _buildActions(action, context)
      ],
    );
  }

  //Constroi o conteúdo principal de pop-up
  Widget _buildImageAndText(String imagePath, String title, String message) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
        //Flexible para a coluna crescer conforme os filhos
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CEIAText.titleSmall(text: title),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CeiaSelectableText.bodyLarge(
                  maxLines: 10,
                  text: message,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  //Constroi o botão de fechar
  Widget _buildCloseButton(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(
          Icons.close,
          size: 14,
        ),
      ),
    );
  }

  //Constroi uma região que aumenta conforme o tamanho dos widgets filhos e que é escrolável
  Widget _buildScrollableReponsiveRegion(Widget child) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 15,
        ),
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            primary: true,
            child: child,
          ),
        ),
      ),
    );
  }

  //Constroi os botões com as ações do pop-up
  Widget _buildActions(Function()? action, BuildContext context) {
    if (action != null) {
      return Padding(
        padding: const EdgeInsets.only(
          right: 24,
          left: 24,
          bottom: 20,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CeiaButtonNew(
        borderRadius: 5,
        text: 'Fechar',
        width: 97,
        height: 26,
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
