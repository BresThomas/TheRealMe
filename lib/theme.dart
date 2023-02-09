import 'package:flutter/material.dart';

class CustomThemes {
  static final Color primaryColor = const Color(0xff80AB82);
  static final Color secondaryColor = Color.fromARGB(255, 255, 255, 255);

  static final lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      primary: primaryColor,
    ),
    appBarTheme: AppBarTheme(backgroundColor: primaryColor),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
    ),
    appBarTheme: AppBarTheme(backgroundColor: primaryColor),
  );
}
