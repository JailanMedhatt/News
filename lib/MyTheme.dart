import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryGreen=Color(0xff39A552);
  static ThemeData myTheme= ThemeData(
primaryColor: primaryGreen,
    appBarTheme: AppBarTheme(
      color: primaryGreen,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      )
    ),
  );
}