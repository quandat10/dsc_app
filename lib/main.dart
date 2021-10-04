import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/intro_screen.dart';

import './utils/routes.dart';
import './utils/colors.dart';

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
        iconTheme: IconThemeData(color: Colors.black),
        primarySwatch: PRIMARY_COLOR,
        accentColor: ACCENT_COLOR,
      ),
      home: IntroScreen(),
      routes: routes,
    );
  }
}
