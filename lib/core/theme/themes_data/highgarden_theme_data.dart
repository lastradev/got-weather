import 'package:flutter/material.dart';

const highgardenColor = Color(0xFF092633);

final highgardenThemeData = ThemeData(
  primaryColor: highgardenColor,
  colorScheme: const ColorScheme(
    primary: highgardenColor,
    primaryVariant: highgardenColor,
    secondary: Colors.white,
    secondaryVariant: highgardenColor,
    surface: highgardenColor,
    background: highgardenColor,
    error: highgardenColor,
    onPrimary: Colors.white,
    onSecondary: highgardenColor,
    onSurface: Colors.white,
    onBackground: highgardenColor,
    onError: highgardenColor,
    brightness: Brightness.dark,
  ),
  textTheme: TextTheme(
    headline2: TextStyle(
      color: Colors.white,
      shadows: [
        Shadow(
          offset: Offset.fromDirection(0, 4),
        ),
      ],
    ),
    headline4: const TextStyle(color: Colors.white),
    headline6: const TextStyle(color: Colors.white),
  ),
  fontFamily: 'Poppins',
);
