import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as html;

class RoutesUtils {
  RoutesUtils._();

  static void redirectToExternalPage(Uri url) async {
    if (kIsWeb) {
      // Código específico para a web
      html.window.open(url.toString(), '_self');
    } else {
      // Código para outras plataformas móveis e desktop
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Não foi possível iniciar a $url';
      }
    }
  }

  static void redirectToAuthModule() async {
    final authUri = Uri.parse('https://swceia-dev-authentication.web.app/');

    if (kIsWeb) {
      // Código específico para a web
      html.window.open(authUri.toString(), '_self');
    } else {
      // Código para outras plataformas móveis e desktop
      if (await canLaunchUrl(authUri)) {
        await launchUrl(authUri);
      } else {
        throw 'Não foi possível iniciar a $authUri';
      }
    }
  }
}
