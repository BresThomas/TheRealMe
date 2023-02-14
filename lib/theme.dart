import 'package:flutter/material.dart';

class CustomThemes {
  static final Color primaryColor = const Color(0xff80AB82);
  static final Color secondaryColor = Color.fromARGB(255, 255, 255, 255);
  static final Color thirdColor = Colors.black54;

  static final Color green = const Color(0xffEDF3DD);
  static final Color pink = const Color(0xffFBE5DB);
  static final Color yellow = const Color(0xffFFF3DB);
  static final Color black = Color.fromARGB(255, 0, 0, 0);

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
