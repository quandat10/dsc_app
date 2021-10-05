import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/models/post.dart';
import 'package:dsc_app/screens/news_page/news_screen.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:dsc_app/widgets/club_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../widgets/drawer.dart';
import 'widgets/home_screen_logo.dart';
import '../../widgets/news_slider.dart';
import 'widgets/category_list_view.dart';
import 'widgets/posts_item.dart';

class HomeScreen extends StatefulWidget {
  static const tag = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<News>(context).news;
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomedDrawer(),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            stretch: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text('Trang chủ', style: TextStyle(color: Colors.black)),
              // centerTitle: true,
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground
              ],
              background: HomeScreenLogo(),
            ),
            expandedHeight: 450,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
            leading: IconButton(
              icon: Icon(
                Icons.sort,
                color: Colors.black,
              ),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: CategoryListView(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return PostsItem(news[index]);
            }, childCount: news.length <= 9 ? news.length : 9),
          ),
          SliverToBoxAdapter(
            child: InkWell(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(NewsScreen.tag),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: Text(
                  'Xem thêm...',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ClubInformation(),
            ]),
          )
        ],
      ),
    );
  }
}
