import 'package:flutter/material.dart';

class AppColors {

  static Color primaryColor = const Color(0xFF3E933E);
  static Color primaryLightColor = const Color(0xFF8ABE96);
  static Color unSelectedUserTypeColor = const Color(0xFFEBF5ED);

  static Color headerColor = const Color(0xFF3D523D);
  static Color labelColor = const Color(0xFF1B3D1B);
  static Color hintTextColor = const Color(0xFFA99C95);
  static Color inputBorderColor = const Color(0xFFFAFAFC);

  static Color scaffoldColor = const Color(0xffFCFCFC);
  static Color accentColors = const Color(0xff76482C);

  static Color text = const Color(0xFF194719);
  static Color blue = const Color(0xFF0747A6);
  static Color blueLight = const Color(0xFFDEEBFF);
  static Color textLight = const Color.fromARGB(99, 61, 82, 61);
  static Color purple = const Color(0xFF8C7AFF);
  static Color darkPurple = const Color(0xFF090C4D);
  static Color shadowColor = const Color(0xFF565BDD).withOpacity(.1);
  static Color loginBGColor = const Color(0xFFFFF2E1);
  static Color linkColor = const Color(0xFF0052CC);
  static Color borderColor = const Color(0xFF000000).withOpacity(.36);
  static Color grey = const Color(0xFFECEBEA);
  static Color grey2 = const Color(0xFFE8EBFA);
  static Color divider = const Color.fromARGB(255, 45, 45, 45);

  static Color border = const Color(0xFFDDDBDA);

  static Color errorColor = const Color(0xFFFF0000).withOpacity(.15);
  static Color errorBorderColor = const Color(0xFFFF0000);

  static LinearGradient blueGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      const Color(0xFF204ECF),
      const Color(0xFF204ECF).withOpacity(.80),
      const Color(0xFF204ECF).withOpacity(.60),
      const Color(0xFF204ECF).withOpacity(.20)
    ],
  );

}