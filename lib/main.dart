import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './screens/intro_screen.dart';

import './utils/routes.dart';
import './utils/colors.dart';
import 'models/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Events>(
          create: (ctx) => Events(),
        ),
        ChangeNotifierProvider<News>(
          create: (ctx) => News(),
        )
      ],
      child: MaterialApp(
        title: 'DSC App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconTheme: IconThemeData(color: Colors.black),
          primarySwatch: PRIMARY_COLOR,
          accentColor: ACCENT_COLOR,
        ),
        home: IntroScreen(),
        routes: routes,
      ),
    );
  }
}
