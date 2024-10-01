class StringUtils {
  static String getFirstWord(String text) {
    List<String> textParts = text.split(' ');
    return textParts[0];
  }

  static String getShortName(String name) {
    List<String> nameParts = name.split(' ');

    if (nameParts.length == 1) return nameParts[0];

    final shortName = '${nameParts[0]} ${nameParts[1][0]}.';
    return shortName;
  }

  static String getFirstLetter(String input) {
    if (input.isEmpty) {
      return '';
    }
    return input[0];
  }

  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
