import 'package:flutter/material.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';

abstract class TextStyles {
  static const TextStyle headline1 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: "HeliosExtC",
      letterSpacing: 0.29,
      color: AppColors.textMain);

  static const TextStyle headline2 = TextStyle(
      fontSize: 16.01,
      fontWeight: FontWeight.w700,
      fontFamily: "HeliosExtC",
      letterSpacing: 0.44,
      color: Color(0xffFFFFFF));

  static const TextStyle headline3 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: "HeliosExtC",
      letterSpacing: 0.29,
      color: Color(0xffC1C1C1));

  static const TextStyle buttonText = TextStyle(
    color: AppColors.textMain,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: "HeliosExtC",
  );

  static const TextStyle body1 = TextStyle(
    color: Colors.white60,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: "HeliosExtC",
    letterSpacing: 0.29,
  );

  static const TextStyle subText2 = TextStyle(
    color: Color(0xffC1C1C1),
    fontSize: 9,
    fontWeight: FontWeight.w500,
    fontFamily: "HeliosExtC",
  );

  static const TextStyle subText3 = TextStyle(
    color: Color(0xff9D9898),
    fontSize: 11.3,
    fontWeight: FontWeight.w400,
    fontFamily: "HeliosExtC",
  );

  static const TextStyle subText1 = TextStyle(
    color: Color(0xffB8BABD),
    fontSize: 12.25,
    fontWeight: FontWeight.w400,
    fontFamily: "HeliosExtC",
    letterSpacing: 0.12,
  );

  static const TextStyle numbers = TextStyle(
    color: AppColors.textMain,
    fontSize: 26,
    fontWeight: FontWeight.w400,
    fontFamily: "HeliosExtC",
  );

  static const TextStyle monoska = TextStyle(
    color: AppColors.textMain,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    fontFamily: "Monoska",
  );

  static TextStyle gradientText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.29,
      foreground: Paint()..shader = AppColors.linearGradientText);
}
