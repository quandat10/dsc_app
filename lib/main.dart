import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/intro_screen.dart';

import './utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            toolbarTextStyle: TextStyle(
              fontWeight: FontWeight.w900
            ),
          ),
          textTheme: TextTheme(
            headline6: GoogleFonts.inter(),
          ),
          fontFamily: GoogleFonts.inter().fontFamily,
          canvasColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        home: IntroScreen(),
        routes: routes,
    );
  }
}
