import 'dart:ui';

import 'package:dsc_app/apis/blogs_api.dart';
import 'package:dsc_app/apis/events_api.dart';
import 'package:dsc_app/models/blogs/blog_model.dart';
import 'package:dsc_app/models/event/event_model.dart';
import 'package:dsc_app/providers/tabs_navigation_provider.dart';
import 'package:dsc_app/screens/blog_screen/widgets/posts_item.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/widgets/news_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const tag = '/home';

  HomeScreen({Key? key}) : super(key: key);

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
              fontWeight: FontWeight.w700,
              letterSpacing: -0.56,
              color: ERROR_COLOR,
            ),
          ),
          InkWell(
            onTap: function,
            highlightColor: PRIMARY_COLOR,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: const Text(
                      'Xem thêm',
                      style: TextStyle(fontSize: 12,
                          color: PRIMARY_COLOR,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/arrow.svg', color: PRIMARY_COLOR,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var setPageIndex = Provider
        .of<TabsNavigationProvider>(context, listen: false)
        .setPageIndex;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: new BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _textHeaderItem('Sự kiện mới nhất', () {
                  setPageIndex(2);
                })),
            SizedBox(height: 15),
            FutureBuilder(
              future: EventsApi().getEvents(pageKey: 0),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  var events = snapshot.data as List<EventModel>;
                  return NewsSlider(events.sublist(0, 3).toList());
                }
                else {
                  return const Center(child: CircularProgressIndicator(),);
                }
              },
            ),
            SizedBox(height: 15),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _textHeaderItem('Bài viết mới nhất', () {
                  setPageIndex(3);
                })),
            FutureBuilder(
              future: BlogsApi().getBlogs(
                  numberMode: GetNumber.Limited, number: 5),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  List<BlogModel> blogs = snapshot.data as List<BlogModel>;
                  return AnimationLimiter(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: blogs.length,
                      itemBuilder: (_, index) =>
                          AnimationConfiguration.staggeredList(
                              duration: const Duration(milliseconds: 500),
                              position: index,
                              child: ScaleAnimation(
                                  child: FadeInAnimation(
                                      child: PostsItem(blogs[index])))),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
