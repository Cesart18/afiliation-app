


import 'package:flutter/material.dart';

class AppTheme {

    final bool isDarkmode;
    AppTheme({this.isDarkmode = false});

    ThemeData getTheme() => ThemeData(
      brightness: isDarkmode ? Brightness.dark : Brightness.light
    );

  }