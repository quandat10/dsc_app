import 'dart:io';

import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class CustomedDrawer extends StatelessWidget {
  const CustomedDrawer({Key? key}) : super(key: key);

  List<Widget> _drawerItem(
      String title, IconData icon, String routeName, BuildContext context) {
    return [
      ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () =>
            Navigator.of(context).pushReplacementNamed(HomeScreen.ROUTE_NAME),
      ),
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
              child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://scontent.fhan3-4.fna.fbcdn.net/v/t1.6435-9/213722001_490471052304887_7731603353795101882_n.png?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=3ZEegaA0mTcAX-2k48Z&_nc_ht=scontent.fhan3-4.fna&oh=8d4c918f56e3c58fa8a7c509a5454ef4&oe=617D56EB')),
            ),
            ..._drawerItem('Home', Icons.home, HomeScreen.ROUTE_NAME, context),
            ..._drawerItem(
                'News', Icons.library_books, HomeScreen.ROUTE_NAME, context),
            ..._drawerItem(
                'Events', Icons.event, HomeScreen.ROUTE_NAME, context),
            ..._drawerItem(
                'Members', Icons.people, HomeScreen.ROUTE_NAME, context),
            ..._drawerItem('Recruitment', Icons.perm_identity,
                HomeScreen.ROUTE_NAME, context),
            ..._drawerItem('Products', Icons.business_center,
                HomeScreen.ROUTE_NAME, context),
            ..._drawerItem(
                'Contact', Icons.local_phone, HomeScreen.ROUTE_NAME, context),
            ..._drawerItem(
                'About Us', Icons.announcement, HomeScreen.ROUTE_NAME, context),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Quit'),
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
