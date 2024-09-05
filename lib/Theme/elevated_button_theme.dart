import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        iconColor: Colors.white,
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: TColors.healthGreen,
    disabledBackgroundColor: Colors.grey,
    disabledForegroundColor: Colors.grey,
    side: const BorderSide(color: TColors.healthGreen),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
      fontFamily: 'Poppins',
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ));

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        iconColor: Colors.white,
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: TColors.healthGreen,
    disabledBackgroundColor: Colors.grey,
    disabledForegroundColor: Colors.grey,
    side: const BorderSide(color: TColors.healthGreen),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle( fontFamily: 'Poppins',
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ));
}
