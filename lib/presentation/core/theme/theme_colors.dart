import 'package:flutter/material.dart';

abstract class AppColors {
  static const accent = Color(0xff623BFF);
  static const indicator = Color(0xff6993FF);
  static const textMain = Color.fromARGB(255, 242, 245, 244);
  static const card = Color(0xFF2A2A34);
  static const mainbgc = Color(0xFF0E0E13);
  static const secondbgc = Color(0xFF19191C);
  static const red = Color(0xffFF0000);
  static const divider = Color(0xff4A4A4A);
  static final Shader linearGradientText = const LinearGradient(
    colors: <Color>[
      Colors.white24,
      Colors.white60,
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static const colorGradientSilver = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffEFCFC4),
        Color(0xff9DBEDE),
      ]);
  static const colorGradientBlue = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xffDA4ECB),
        Color(0xff2C3AE8),
        Color(0xff467FC9),
      ]);
  static const confirmedGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff5E4F5C),
        Color(0xff505273),
        Color(0xff424A54),
      ]);
  static const iconColor = Colors.white;
  static const border = Color(0xffD3D2D2);
}

abstract class _DarkColors {
  static const background = AppColors.mainbgc;
  static const card = AppColors.card;
}

abstract class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;
  static ThemeData dark() => ThemeData(
        scaffoldBackgroundColor: _DarkColors.background,
        splashColor: accentColor,
        brightness: Brightness.light,
        visualDensity: visualDensity,
        cardTheme: const CardTheme(color: AppColors.card),
        fontFamily: "HeliosExtC",
        cardColor: _DarkColors.card,
        iconTheme: const IconThemeData(color: AppColors.iconColor),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
      );
}
