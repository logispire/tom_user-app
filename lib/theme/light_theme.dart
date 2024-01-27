import 'package:flutter/material.dart';
import 'package:sixam_mart/util/app_constants.dart';

ThemeData light({Color color = const Color(0xFF217D3E)}) => ThemeData(
      fontFamily: AppConstants.fontFamily,
      primaryColor: const Color(0xFF217D3E),
      secondaryHeaderColor: const Color(0xFF1ED7AA),
      disabledColor: const Color(0xFFBABFC4),
      brightness: Brightness.light,
      hintColor: const Color(0xFF9F9F9F),
      cardColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
          style:
              TextButton.styleFrom(foregroundColor: const Color(0xFF217D3E))),
      colorScheme: const ColorScheme.light(
              primary: Color(0xFF217D3E), secondary: Color(0xFF449B47))
          .copyWith(background: const Color(0xFFF3F3F3))
          .copyWith(error: const Color(0xFFE84D4F)),
    );
