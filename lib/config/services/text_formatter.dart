


class TextFormatter {

  static String firstLetterToUpper( String value ){
    final formattedString = value[0].toUpperCase() + value.substring(1);
    return formattedString.trim();
  }

}