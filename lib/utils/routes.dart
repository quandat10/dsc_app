import 'package:dsc_app/screens/event_page/event_screen.dart';
import 'package:dsc_app/screens/home_page/home_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.tag: (context) => HomeScreen(),
  EventScreen.tag: (context) => EventScreen(),
};
