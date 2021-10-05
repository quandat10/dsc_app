import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/screens/contact_screen/contact_screen.dart';
import 'package:dsc_app/screens/event_page/event_screen.dart';
import 'package:dsc_app/screens/member_screen/member_screen.dart';
import 'package:dsc_app/screens/news_page/news_screen.dart';
import 'package:dsc_app/screens/products_screen/products_screen.dart';
import 'package:dsc_app/screens/recruitment_screen/recruitment_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home_page/home_screen.dart';

import '../utils/strings.dart';
import '../utils/colors.dart';

class CustomedDrawer extends StatelessWidget {
  const CustomedDrawer({Key? key}) : super(key: key);

  List<Widget> _drawerItem(
      String title, IconData icon, String routeName, BuildContext context) {
    return [
      ListTile(
          leading: Icon(icon),
          title: Text(title),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(routeName);
          }),
      Divider(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    'https://scontent.fhan3-4.fna.fbcdn.net/v/t1.6435-9/213722001_490471052304887_7731603353795101882_n.png?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=3ZEegaA0mTcAX-2k48Z&_nc_ht=scontent.fhan3-4.fna&oh=8d4c918f56e3c58fa8a7c509a5454ef4&oe=617D56EB',
                placeholder: (ctx, url) => CircularProgressIndicator(),
                errorWidget: (ctx, url, error) => const Icon(Icons.error),
              ),
            ),
            ..._drawerItem(TITLE_HOME, Icons.home, HomeScreen.tag, context),
            ..._drawerItem(
                TITLE_NEWS, Icons.library_books, NewsScreen.tag, context),
            ..._drawerItem(TITLE_EVENTS, Icons.event, EventScreen.tag, context),
            ..._drawerItem(
                TITLE_MEMBERS, Icons.people, MemberScreen.tag, context),
            ..._drawerItem(TITLE_RECRUITMENT, Icons.perm_identity,
                RecruitmentScreen.tag, context),
            ..._drawerItem(
                TITLE_PRODUCTS, Icons.business_center, ProductsScreen.tag, context),
            ..._drawerItem(
                TITLE_CONTACT, Icons.local_phone, ContactScreen.tag, context),
            ..._drawerItem(
                'About Us', Icons.announcement, HomeScreen.tag, context),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(TITLE_QUIT),
              onTap: () {
                exit(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
