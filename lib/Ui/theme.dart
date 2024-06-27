import 'package:flutter/material.dart';

class DarkTheme {
  final primaryColor = Color(0xff0F121B);
  final secondryColor = Color(0xff4AACAB);
  final primaryTextColor = Color(0xffFFFFFF);
  final secondryTextColor = Color(0x78ffffff);
  final appBarColor = Color(0xff0F121B);
}

class MyAppThemeConfig {
  static const String faFontFamily = 'IranYekan';
  static const String enFontFamily = 'Inter';
  final Color primaryColor;
  final Color secondryColor;
  final Color primaryTextColor;
  final Color secondryTextColor;
  final Color appBarColor;

  MyAppThemeConfig.dark()
      :primaryColor=Color(0xff0F121B),
        secondryColor=Color(0xff4AACAB),
        primaryTextColor=Color(0xffFFFFFF),
        secondryTextColor=Color(0x78ffffff),
        appBarColor=Color(0xff0F121B);

  MyAppThemeConfig.light()
      :primaryColor=Color(0xffF2F4F8),
        secondryColor=Color(0xffF2F4F8),
        primaryTextColor=Color(0xff12141B),
        secondryTextColor=Color(0xf75C6068),
        appBarColor=Color(0xffF2F4F8);

}
