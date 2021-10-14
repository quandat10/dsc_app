import 'dart:math';

import 'package:dsc_app/screens/home_page/home_screen.dart';
import 'package:dsc_app/screens/products_screen/products_screen.dart';
import 'package:dsc_app/screens/save_screen/save_screen.dart';
import 'package:dsc_app/screens/search_screen/search_screen.dart';
import 'package:dsc_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math_64.dart';

import 'blog_screen/blog_screen.dart';
import 'event_screen/event_screen.dart';
import 'info_screen/info_screen.dart';
import 'member_screen/member_screen.dart';

class TabsScreen extends StatefulWidget {
  static const tag = '/tabs';

  TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  var _selectedScreenIndex = 0;
  PageController pageController = PageController();
  final _screenList = [
    {'screen': HomeScreen(), 'index': 0},
    {'screen': SearchScreen(), 'index': 1},
    {'screen': EventScreen(), 'index': 2},
    {'screen': BlogScreen(), 'index': 3},
    {'screen': SaveScreen(), 'index': 4},
    {'screen': MemberScreen(), 'index': 5},
    {'screen': ProductsScreen(), 'index': 6},
    {'screen': InfoScreen(), 'index': 7},
  ];

  void _setPageIndex(int index) {
    setState(() {
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
    Future.delayed(Duration(milliseconds: 500))
        .then((value) => _selectedScreenIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            pageController.animateToPage(0,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          },
          child: Container(
            //margin: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Google Developer Student Clubs',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      BoxShadow(
                          color: Color(0x700D253c),
                          offset: Offset(0, 2),
                          blurRadius: 5)
                    ],
                  ),
                ),
                const Text(
                  'Hanoi University of Science and Technology',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      BoxShadow(
                          color: Color(0x700D253c),
                          offset: Offset(0, 2),
                          blurRadius: 5)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.bell),
          ),
        ],
      ),
      body: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            _selectedScreenIndex = index;
          });
        },
        controller: pageController,
        itemCount: _screenList.length,
        itemBuilder: (context, index) => _screenList.firstWhere(
            (element) => element['index'] == index)['screen'] as Widget,
      ),
      bottomNavigationBar: BottomNavBar(_setPageIndex, _selectedScreenIndex),
    );
  }
}
