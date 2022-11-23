import 'package:flutter/material.dart';

ThemeData customTheme() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color.fromRGBO(10, 14, 33, 1.0),
    appBarTheme: const AppBarTheme(
      color: Color.fromRGBO(10, 13, 34, 1.0),
    ),
  );
}
