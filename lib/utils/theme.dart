import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AppTheme {
  MyTheme,
}

final myTheme = {
  AppTheme.MyTheme: ThemeData(
    primarySwatch: color,
    primaryColorDark: color.shade900,
    primaryColor: color.shade700,
    accentColor: color.shade300,
    backgroundColor: color,
    scaffoldBackgroundColor: color.shade100,
    buttonColor: color.shade50,
    brightness: Brightness.dark,
    cardColor: Colors.white,
  ),
};

const MaterialColor color = const MaterialColor(
  0xff5856d6,
  const <int, Color>{
    50: const Color(0xfff4f4fc),
    100: const Color(0xffe4e4f8),
    200: const Color(0xffd5d4f5),
    300: const Color(0xffb6b5ed),
    400: const Color(0xff9695e5),
    500: const Color(0xff7776de),
    600: const Color(0xff6866da),
    700: const Color(0xff5856d6),
    800: const Color(0xff4846d2),
    900: const Color(0xff3936ce)
  },
);
