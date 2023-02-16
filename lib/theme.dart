import 'package:flutter/material.dart';

class CustomThemes {
  static final Color primaryColor = const Color(0xffC1CEA1);
  static final Color secondaryColor = Color.fromARGB(255, 255, 255, 255);
  static final Color thirdColor = Colors.black54;

  static final Color green = const Color(0xffDFEAC3);
  static final Color pink = const Color(0xffF7CAB6);
  static final Color yellow = const Color(0xffFFEBC2);
  static final Color black = Color.fromARGB(255, 0, 0, 0);
  static final Color white = Color.fromARGB(255, 255, 255, 255);

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
