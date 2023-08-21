import 'package:flutter/material.dart';

class QYTheme {
  static const double smallFontSize = 16;
  static const double mediumFontSize = 20;
  static const double largeFontSize = 24;

  // 普通模式
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Color.fromRGBO(255, 123, 17, 1.0),
    ),
    canvasColor: Color.fromRGBO(255, 254, 222, 1), // 背景色
    textTheme: TextTheme(
      displaySmall: TextStyle(fontSize: smallFontSize),
      displayMedium: TextStyle(fontSize: mediumFontSize),
      displayLarge: TextStyle(fontSize: largeFontSize),
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.deepOrangeAccent),
  );

  // 暗黑模式
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Color.fromRGBO(178, 77, 77, 1),
    ),
  );
}
