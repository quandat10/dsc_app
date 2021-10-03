import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/intro_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'DSC App',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.black),
        primarySwatch: Colors.blue,
      ),
      home: IntroScreen(),
      routes: {
        HomeScreen.ROUTE_NAME: (ctx) => HomeScreen(),
      },
    );
  }
}

