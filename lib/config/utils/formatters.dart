


import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:intl/intl.dart';

class Formatters {

  static String firstLetterToUpper( String value ){
    final formattedString = value[0].toUpperCase() + value.substring(1);
    return formattedString.trim();
  }

  static double totalAmount( List<UserHistorial> historial ){
  double totalAmount = 0;
  final listHistorial = historial.toList();
    for ( int i = 0; i < listHistorial.length; i++ ){
      totalAmount += listHistorial[i].amount;
    }
  return totalAmount;
}
  static String formatNationalId( String value ){
    final numberFormat = NumberFormat('#,###', 'en_US');
    int idAsInt = int.parse(value);
    return numberFormat.format(idAsInt).replaceAll(RegExp(r','), '.');

  }
  static String formatDateTime(DateTime dateTime) {
    // Formatear la fecha como year-month-day
    final dateFormat = DateFormat('yyyy-MM-dd');
    String formattedDate = dateFormat.format(dateTime);

    // Formatear la hora en formato de 12 horas con AM/PM
    final timeFormat = DateFormat('h:mm a');
    String formattedTime = timeFormat.format(dateTime);

    return '$formattedDate $formattedTime';
  }

}