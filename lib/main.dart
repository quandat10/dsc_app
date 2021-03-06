import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dsc_app/apis/device_entry_api.dart';
import 'package:dsc_app/providers/blogs_provider.dart';
import 'package:dsc_app/providers/events_provider.dart';
import 'package:dsc_app/providers/tabs_navigation_provider.dart';
import 'package:dsc_app/screens/tabs_screen.dart';
import 'package:dsc_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './screens/intro_screen.dart';

import './utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFirstEntry = true;
  bool loading = true;

  @override
  void initState() {
    checkFirstEntry();
    super.initState();
  }

  void checkFirstEntry() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      DeviceEntryApi()
          .getDeviceFirstEntryCheck(deviceID: androidInfo.androidId as String)
          .then((value) => setState(() {
                isFirstEntry = value;
              }));
      print(androidInfo.androidId);
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      DeviceEntryApi()
          .getDeviceFirstEntryCheck(
              deviceID: iosInfo.identifierForVendor as String)
          .then((value) => setState(() {
                isFirstEntry = value;
              }));
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(isFirstEntry);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<EventsProvider>(
            create: (context) => EventsProvider(),
          ),
          ChangeNotifierProvider<BlogsProvider>(
            create: (context) => BlogsProvider(),
          ),
          ChangeNotifierProvider<TabsNavigationProvider>(
            create: (context) => TabsNavigationProvider(),
          )
        ],
        child: MaterialApp(
          title: 'DSC App',
          debugShowCheckedModeBanner: false,
          theme: brightTheme,
          home: AnimatedSplashScreen(
            animationDuration: Duration(seconds: 2),
            splashIconSize: 300,
            curve: Curves.easeInCirc,
            splash: 'assets/images/dsc_logo.png',
            nextScreen: loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (isFirstEntry ? IntroScreen() : TabsScreen()),
            duration: 2500,
          ),
          routes: routes,
        ));
  }
}
