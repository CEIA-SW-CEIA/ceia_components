import 'package:flutter/material.dart';

class CEIAText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  /*
    TIPOGRAFIA
    Fonte: Montserrat
    A fonte Montserrat foi escolhida por sua legibilidade e versatilidade.Corrigido: É uma fonte sans-serif, ideal para criar uma interface profissional e amigável.
    Estrutura Tipográfica
    Para garantir clareza e hierarquia visual, a tipografia foi dividida um três categorias: Títulos, Subtítulos e Corpo de Texto, com variações de tamanho e peso.5
  */

  /// Para títulos grandes (H1).
  /// - Tamanho: 27px
  /// - Peso: Bold
  /// - Uso: Cabeçalhos principais.
  ///
  /// Parametros:
  /// - [color] é usado para sobreescrever a cor padrão do título quando necessário.
  /// - [fontWeight] é usado para sobreescrever o peso padrão do título quando necessário.
  CEIAText.titleLarge({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.overflow,
    Color? color,
    FontWeight? fontWeight,
  }) : style = TextStyle(
          fontSize: 27,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontFamily: 'Montserrat',
          color: color ?? Colors.black,
        );

  /// Para títulos médios (H2).
  /// - Tamanho: 27px
  /// - Peso: Medium
  /// - Uso: Subsecções importantes.
  ///
  /// Parametros:
  /// - [color] é usado para sobreescrever a cor padrão do título quando necessário.
  /// - [fontWeight] é usado para sobreescrever o peso padrão do título quando necessário.
  CEIAText.titleMedium({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.overflow,
    Color? color,
    FontWeight? fontWeight,
  }) : style = TextStyle(
          fontSize: 27,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontFamily: 'Montserrat',
          color: color ?? Colors.black,
        );

  /// Para títulos pequenos (H3).
  /// - Tamanho: 21px
  /// - Peso: Bold
  /// - Uso: Títulos menores.
  ///
  /// Parametros:
  /// - [color] é usado para sobreescrever a cor padrão do título quando necessário.
  /// - [fontWeight] é usado para sobreescrever o peso padrão do título quando necessário.
  CEIAText.titleSmall({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.overflow,
    Color? color,
    FontWeight? fontWeight,
  }) : style = TextStyle(
          fontSize: 21,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontFamily: 'Montserrat',
          color: color ?? Colors.black,
        );

  /// Para subtítulos grandes (H4).
  /// - Tamanho: 18px
  /// - Peso: SemiBold
  /// - Uso: Introduções e descrições importantes.
  ///
  /// Parametros:
  /// - [color] é usado para sobreescrever a cor padrão do título quando necessário.
  /// - [fontWeight] é usado para sobreescrever o peso padrão do título quando necessário.
  CEIAText.subtitleLarge({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.overflow,
    Color? color,
    FontWeight? fontWeight,
  }) : style = TextStyle(
          fontSize: 18,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontFamily: 'Montserrat',
          color: color ?? Colors.black,
        );

  /// Para subtítulos médios (H5).
  /// - Tamanho: 16px
  /// - Peso: SemiBold
  /// - Uso: Descrições detalhadas.
  ///
  /// Parametros:
  /// - [color] é usado para sobreescrever a cor padrão do título quando necessário.
  /// - [fontWeight] é usado para sobreescrever o peso padrão do título quando necessário.
  CEIAText.subtitleMedium({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.overflow,
    Color? color,
    FontWeight? fontWeight,
  }) : style = TextStyle(
          fontSize: 16,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontFamily: 'Montserrat',
          color: color ?? Colors.black,
        );

  /// Para subtítulos pequenos (H6).
  /// - Tamanho: 12px
  /// - Peso: Medium
  /// - Uso: Labels e instruções específicas.
  ///
  /// Parametros:
  /// - [color] é usado para sobreescrever a cor padrão do título quando necessário.
  /// - [fontWeight] é usado para sobreescrever o peso padrão do título quando necessário.
  CEIAText.subtitleSmall({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.overflow,
    Color? color,
    FontWeight? fontWeight,
  }) : style = TextStyle(
          fontSize: 12,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontFamily: 'Montserrat',
          color: color ?? Colors.black,
        );

  /// Para corpo de texto grandes.
  /// - Tamanho: 16px
  /// - Peso: Regular
  /// - Uso: Texto principal.
  ///
  /// Parametros:
  /// - [color] é usado para sobreescrever a cor padrão do título quando necessário.
  /// - [fontWeight] é usado para sobreescrever o peso padrão do título quando necessário.
  CEIAText.bodyLarge({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.overflow,
    Color? color,
    FontWeight? fontWeight,
  }) : style = TextStyle(
          fontSize: 16,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontFamily: 'Montserrat',
          color: color ?? Colors.black,
        );

  /// Para corpo de texto médios.
  /// - Tamanho: 14px
  /// - Peso: Regular
  /// - Uso: Textos de suporte.
  ///
  /// Parametros:
  /// - [color] é usado para sobreescrever a cor padrão do título quando necessário.
  /// - [fontWeight] é usado para sobreescrever o peso padrão do título quando necessário.
  CEIAText.bodyMedium({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.overflow,
    Color? color,
    FontWeight? fontWeight,
  }) : style = TextStyle(
          fontSize: 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontFamily: 'Montserrat',
          color: color ?? Colors.black,
        );

  /// Para corpo de texto pequenos.
  /// - Tamanho: 12px
  /// - Peso: Regular
  /// - Uso: Rodapés e notas.
  ///
  /// Parametros:
  /// - [color] é usado para sobreescrever a cor padrão do título quando necessário.
  /// - [fontWeight] é usado para sobreescrever o peso padrão do título quando necessário.
  CEIAText.bodySmall({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.overflow,
    Color? color,
    FontWeight? fontWeight,
  }) : style = TextStyle(
          fontSize: 12,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontFamily: 'Montserrat',
          color: color ?? Colors.black,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
