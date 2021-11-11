import 'package:dsc_app/screens/blog_screen/blog_detail_screen.dart';
import 'package:dsc_app/screens/event_screen/event_detail_screen.dart';
import 'package:dsc_app/screens/home_page/home_screen.dart';
import 'package:dsc_app/screens/member_screen/extended_core_team_screen.dart';
import 'package:dsc_app/screens/member_screen/extended_member_screen.dart';
import 'package:dsc_app/screens/member_screen/member_detail_screen.dart';
import 'package:dsc_app/screens/products_screen/products_screen.dart';
import 'package:dsc_app/screens/save_screen/extended_blog_save_screen.dart';
import 'package:dsc_app/screens/save_screen/extended_event_save_screen.dart';
import 'package:dsc_app/screens/tabs_screen.dart';
import 'package:dsc_app/screens/web_view_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.tag: (context) => HomeScreen(),
  ProductsScreen.tag: (context) => ProductsScreen(),
  TabsScreen.tag: (context) => TabsScreen(),
  ExtendedMemberScreen.tag: (context) => ExtendedMemberScreen(),
  ExtendedCoreTeamScreen.tag: (context) => ExtendedCoreTeamScreen(),
  MemberDetailScreen.tag: (context) => MemberDetailScreen(),
  BlogDetailScreen.tag: (context) => BlogDetailScreen(),
  WebViewScreen.tag: (context) => WebViewScreen(),
  EventDetailScreen.tag: (context) => EventDetailScreen(),
  ExtendedEventSaveScreen.tag: (context) => ExtendedEventSaveScreen(),
  ExtendedBlogSaveScreen.tag: (context) => ExtendedBlogSaveScreen(),
};
