import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static String get title => 'U Pizzas';

  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0xFFF8AF36),
        primaryColorDark: const Color(0xFFCF3C29),
        primaryColorLight: const Color.fromARGB(255, 253, 189, 86),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFCF3C29),
        ),
        fontFamily: 'Inter',
      );
}
