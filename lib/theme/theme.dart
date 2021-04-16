import 'package:flutter/material.dart';

Color offWhite = Colors.grey[100];
Color offWhite1 = Colors.grey[200];
Color offWhite2 = Colors.grey[300];
Color offBlack = Colors.grey[900];
Color offBlack1 = Colors.grey[800];
Color offBlack2 = Colors.grey[700];
Color offBlack3 = Colors.grey[500];

InputDecorationTheme inputDecorationTheme() {
  final OutlineInputBorder outlineInputBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(50));

  return InputDecorationTheme(
      fillColor: Color.fromRGBO(39, 46, 61, 0.8),
      filled: true,
      focusColor: offWhite,
      labelStyle: TextStyle(color: offWhite),
      hintStyle: TextStyle(color: offWhite),
      contentPadding: const EdgeInsets.all(20),
      enabledBorder: outlineInputBorder,
      border: outlineInputBorder,
      focusedBorder: outlineInputBorder);
}
