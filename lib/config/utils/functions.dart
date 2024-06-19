import 'package:flutter/material.dart';




class Functions {

  static showModal(BuildContext context, Widget widget ){
  showDialog(
    barrierDismissible: false,
    context: context, builder: (context) {
    return widget;
  },);
}

}