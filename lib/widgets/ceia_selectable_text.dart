import 'package:ceia_components/widgets/ceia_text.dart';
import 'package:flutter/material.dart';

///Constroi um texto selecionável, utilizando
/// os estilos predefinidos do [CEIAText].

class CeiaSelectableText {
  CeiaSelectableText._();

  /// Cria um texto de título grande (H1) que pode ser selecionado.
  static Widget titleLarge({
    Key? key,

    /// O texto a ser exibido.
    required String text,

    /// Como o texto deve ser alinhado horizontalmente.
    TextAlign? textAlign,

    /// O número máximo de linhas para o texto.
    int? maxLines,

    /// Como o excesso de texto visual deve ser tratado.
    TextOverflow? overflow,

    /// A cor a ser usada ao pintar o texto.
    Color? color,

    /// O peso (espessura) da fonte.
    FontWeight? fontWeight,
  }) {
    return SelectionArea(
      child: CEIAText.titleLarge(
        key: key,
        text: text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  /// Cria um texto de título médio (H2) que pode ser selecionado.
  static Widget titleMedium({
    Key? key,

    /// O texto a ser exibido.
    required String text,

    /// Como o texto deve ser alinhado horizontalmente.
    TextAlign? textAlign,

    /// O número máximo de linhas para o texto.
    int? maxLines,

    /// Como o excesso de texto visual deve ser tratado.
    TextOverflow? overflow,

    /// A cor a ser usada ao pintar o texto.
    Color? color,

    /// O peso (espessura) da fonte.
    FontWeight? fontWeight,
  }) {
    return SelectionArea(
      child: CEIAText.titleMedium(
        key: key,
        text: text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  /// Cria um texto de título pequeno (H3) que pode ser selecionado.
  static Widget titleSmall({
    Key? key,

    /// O texto a ser exibido.
    required String text,

    /// Como o texto deve ser alinhado horizontalmente.
    TextAlign? textAlign,

    /// O número máximo de linhas para o texto.
    int? maxLines,

    /// Como o excesso de texto visual deve ser tratado.
    TextOverflow? overflow,

    /// A cor a ser usada ao pintar o texto.
    Color? color,

    /// O peso (espessura) da fonte.
    FontWeight? fontWeight,
  }) {
    return SelectionArea(
      child: CEIAText.titleSmall(
        key: key,
        text: text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  /// Cria um texto de corpo grande que pode ser selecionado.
  static Widget bodyLarge({
    Key? key,

    /// O texto a ser exibido.
    required String text,

    /// Como o texto deve ser alinhado horizontalmente.
    TextAlign? textAlign,

    /// O número máximo de linhas para o texto.
    int? maxLines,

    /// Como o excesso de texto visual deve ser tratado.
    TextOverflow? overflow,

    /// A cor a ser usada ao pintar o texto.
    Color? color,

    /// O peso (espessura) da fonte.
    FontWeight? fontWeight,
  }) {
    return SelectionArea(
      child: CEIAText.bodyLarge(
        key: key,
        text: text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  /// Cria um texto de corpo médio que pode ser selecionado.
  static Widget bodyMedium({
    Key? key,

    /// O texto a ser exibido.
    required String text,

    /// Como o texto deve ser alinhado horizontalmente.
    TextAlign? textAlign,

    /// O número máximo de linhas para o texto.
    int? maxLines,

    /// Como o excesso de texto visual deve ser tratado.
    TextOverflow? overflow,

    /// A cor a ser usada ao pintar o texto.
    Color? color,

    /// O peso (espessura) da fonte.
    FontWeight? fontWeight,
  }) {
    return SelectionArea(
      child: CEIAText.bodyMedium(
        key: key,
        text: text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  /// Cria um texto de corpo pequeno que pode ser selecionado.
  static Widget bodySmall({
    Key? key,

    /// O texto a ser exibido.
    required String text,

    /// Como o texto deve ser alinhado horizontalmente.
    TextAlign? textAlign,

    /// O número máximo de linhas para o texto.
    int? maxLines,

    /// Como o excesso de texto visual deve ser tratado.
    TextOverflow? overflow,

    /// A cor a ser usada ao pintar o texto.
    Color? color,

    /// O peso (espessura) da fonte.
    FontWeight? fontWeight,
  }) {
    return SelectionArea(
      child: CEIAText.bodySmall(
        key: key,
        text: text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  /// Cria um subtítulo pequeno que pode ser selecionado.
  static Widget subtitleSmall({
    Key? key,

    /// O texto a ser exibido.
    required String text,

    /// Como o texto deve ser alinhado horizontalmente.
    TextAlign? textAlign,

    /// O número máximo de linhas para o texto.
    int? maxLines,

    /// Como o excesso de texto visual deve ser tratado.
    TextOverflow? overflow,

    /// A cor a ser usada ao pintar o texto.
    Color? color,

    /// O peso (espessura) da fonte.
    FontWeight? fontWeight,
  }) {
    return SelectionArea(
      child: CEIAText.subtitleSmall(
        key: key,
        text: text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  /// Cria um subtítulo médio que pode ser selecionado.
  static Widget subtitleMedium({
    Key? key,

    /// O texto a ser exibido.
    required String text,

    /// Como o texto deve ser alinhado horizontalmente.
    TextAlign? textAlign,

    /// O número máximo de linhas para o texto.
    int? maxLines,

    /// Como o excesso de texto visual deve ser tratado.
    TextOverflow? overflow,

    /// A cor a ser usada ao pintar o texto.
    Color? color,

    /// O peso (espessura) da fonte.
    FontWeight? fontWeight,
  }) {
    return SelectionArea(
      child: CEIAText.subtitleMedium(
        key: key,
        text: text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  /// Cria um subtítulo grande que pode ser selecionado.
  static Widget subtitleLarge({
    Key? key,

    /// O texto a ser exibido.
    required String text,

    /// Como o texto deve ser alinhado horizontalmente.
    TextAlign? textAlign,

    /// O número máximo de linhas para o texto.
    int? maxLines,

    /// Como o excesso de texto visual deve ser tratado.
    TextOverflow? overflow,

    /// A cor a ser usada ao pintar o texto.
    Color? color,

    /// O peso (espessura) da fonte.
    FontWeight? fontWeight,
  }) {
    return SelectionArea(
      child: CEIAText.subtitleLarge(
        key: key,
        text: text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
