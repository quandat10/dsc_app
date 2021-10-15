import 'dart:ui';

import 'package:dsc_app/screens/home_page/widgets/posts_item.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:dsc_app/widgets/news_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const tag = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _textHeaderItem(String title, void Function() function) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
              color: ERROR_COLOR,
            ),
          ),
          InkWell(
            onTap: function,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: const Text(
                    'Xem thêm',
                    style: TextStyle(fontSize: 12, color: PRIMARY_COLOR),
                  ),
                ),
                const Icon(
                  FontAwesomeIcons.arrowRight,
                  size: 8,
                  color: PRIMARY_COLOR,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height -
              mediaQuery.padding.top -
              mediaQuery.padding.bottom,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _textHeaderItem('Sự kiện mới nhất', () {})),
              SizedBox(height: 15),
              NewsSlider([
                TEST_EVENT_IMAGE,
                TEST_EVENT_IMAGE,
                TEST_EVENT_IMAGE,
                TEST_EVENT_IMAGE,
                TEST_EVENT_IMAGE
              ]),
              SizedBox(height: 15),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _textHeaderItem('Bài viết mới nhất', () {})),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, index) => PostsItem(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
