import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> orange = const <int, Color>{
    50: const Color(0xFFFCF2E7),
    100: const Color(0xFFF8DEC3),
    200: const Color(0xFFF3C89C),
    300: const Color(0xFFEEB274),
    400: const Color(0xFFEAA256),
    500: const Color(0xFFE69138),
    600: const Color(0xFFE38932),
    700: const Color(0xFFDF7E2B),
    800: const Color(0xFFDB7424),
    900: const Color(0xFFD56217)
  };
  static const themeColor = Color(0xFF0BA5EC);
  static const themeColorTransparent = Color(0xFFB9E6FE);
  static const black = Color(0xFF000000);
  static const lightGrayColor = Color(0xFF6D7984);
  static const darkGrayColor = Color(0xFF4A525C);
  static const textHintColor = Color(0xFFB6C6D0);
  static const infoBgColor = Color.fromRGBO(225, 231, 236, 1);
  static const checkButtonInActiveColor = Color(0xFFC5D1D9);
  static const checkButtonActiveColor = Color(0xFF8195A0);
  static const toastBackgroundColor = Color.fromRGBO(0, 0, 0, 0.5);
  static const toastTextColor = Colors.white;
  static const whiteColor = Colors.white;
  static const dividerColor = Color(0xFFECF0F3);
  static const darkGrey = Color(0xFF383E45);
  static const errorRed = Color(0xFFED183E);
}
