import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/intro_screen.dart';
import 'package:page_transition/page_transition.dart';

import './utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'DSC App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black54,
          toolbarTextStyle: TextStyle(fontWeight: FontWeight.w900),
        ),
        textTheme: TextTheme(
          headline6: GoogleFonts.inter(),
        ),
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.inter().fontFamily,
        canvasColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      home: AnimatedSplashScreen(
        animationDuration: Duration(seconds: 2),
        splashIconSize: 300,
        curve: Curves.easeInCirc,
        splash: 'assets/images/dsc_logo.png',
        nextScreen: IntroScreen(),
        duration: 2500,
      ),
      routes: routes,
    );
  }
}
