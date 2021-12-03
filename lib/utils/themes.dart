import 'package:flutter/material.dart';

ThemeData brightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.black54,
    toolbarTextStyle: TextStyle(fontWeight: FontWeight.w900),
  ),
  primarySwatch: Colors.red,
  fontFamily: 'Inter',
  canvasColor: Colors.white,
  iconTheme: IconThemeData(color: Colors.black),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 36,
      letterSpacing: -0.72,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      letterSpacing: -0.48,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 13,
      height: 1.2,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 13,
      letterSpacing: -0.26,
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 12,
      letterSpacing: -0.24,
    ),
    caption: TextStyle(
      fontWeight: FontWeight.w200,
      fontSize: 13,
    ),
    overline: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      letterSpacing: -0.55,
    ),
  )
);