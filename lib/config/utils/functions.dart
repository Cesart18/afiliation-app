import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:flutter/material.dart';




class Functions {

  static showModal(BuildContext context, Widget widget ){
  showDialog(
    barrierDismissible: false,
    context: context, builder: (context) {
    return widget;
  },);
}
  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message), duration: const Duration(seconds: 2)));
  }

  static String discountFormat(List<UserHistorial> historial){
    final totalAmount = Formatters.totalAmount(historial);
    final discount = totalAmount * 5 / 100;
    return '$discount';
  }

}