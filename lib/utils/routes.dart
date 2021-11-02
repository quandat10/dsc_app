import 'package:dsc_app/screens/home_page/home_screen.dart';
import 'package:dsc_app/screens/member_screen/extended_member_screen.dart';
import 'package:dsc_app/screens/member_screen/member_detail_screen.dart';
import 'package:dsc_app/screens/products_screen/products_screen.dart';
import 'package:dsc_app/screens/tabs_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.tag: (context) => HomeScreen(),
  ProductsScreen.tag: (context) => ProductsScreen(),
  TabsScreen.tag: (context) => TabsScreen(),
  ExtendedMemberScreen.tag: (context) => ExtendedMemberScreen(),
  MemberDetailScreen.tag: (context) => MemberDetailScreen(),
};
