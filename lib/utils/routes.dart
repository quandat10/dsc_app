import 'package:dsc_app/screens/contact_screen/contact_screen.dart';
import 'package:dsc_app/screens/event_page/event_detail_screen.dart';
import 'package:dsc_app/screens/event_page/event_screen.dart';
import 'package:dsc_app/screens/home_page/home_screen.dart';
import 'package:dsc_app/screens/member_screen/member_screen.dart';
import 'package:dsc_app/screens/news_page/news_screen.dart';
import 'package:dsc_app/screens/products_screen/products_screen.dart';
import 'package:dsc_app/screens/recruitment_screen/recruitment_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.tag: (context) => HomeScreen(),
  EventScreen.tag: (context) => EventScreen(),
  EventDetailScreen.tag: (context) => EventDetailScreen(),
  NewsScreen.tag: (context) => NewsScreen(),
  MemberScreen.tag: (context) => MemberScreen(),
  RecruitmentScreen.tag: (context) => RecruitmentScreen(),
  ProductsScreen.tag: (context) => ProductsScreen(),
  ContactScreen.tag: (context) => ContactScreen(),
};
