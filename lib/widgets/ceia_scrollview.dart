import 'package:flutter/material.dart';

class CEIAScrollView extends StatelessWidget {
  CEIAScrollView({
    super.key,
    this.child,
    this.scrollDirection = Axis.vertical,
    this.barSize = 12,
  });

  final Widget? child;
  final Axis scrollDirection;
  final double barSize;

  // controller da scrollbar, necessário para que o controle da scrollbar não seja confundindo com outras barras.
  final _pageScrollbarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
      // Tematização da scrollbar
      data: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all<Color>(Colors.grey), // cor da barra controlável
        trackColor: WidgetStateProperty.all<Color>(Colors.green.withOpacity(0.5)), // cor da barra de fundo
        radius: const Radius.circular(2),
        mainAxisMargin: 8,
      ),
      child: Scrollbar(
        // Scrollbar
        controller: _pageScrollbarController,
        thickness: 12,
        thumbVisibility: true,
        child: SingleChildScrollView(
          // ScrollView
          controller: _pageScrollbarController,
          scrollDirection: Axis.horizontal,
          child: child,
        ),
      ),
    );
  }
}
