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

}