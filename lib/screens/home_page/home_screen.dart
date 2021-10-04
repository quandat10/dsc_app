import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../widgets/drawer.dart';
import 'widgets/home_screen_logo.dart';
import '../../widgets/news_slider.dart';
import 'widgets/catogory_list_view.dart';

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
              child: CatogoryListView(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Show Post'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            child: const Text('OK'),
                          )
                        ],
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: Text(
                        'Design System Resources',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      subtitle: Text(
                          'And what you can expect to learn from each all the top resources...'),
                      trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          height: 50,
                          width: 50,
                          imageUrl: THUMBNAIL_IMAGE_HOMEPAGE_URL,
                          placeholder: (context, url) => Center(
                            child: SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: new CircularProgressIndicator(
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }, childCount: 9),
          ),
          SliverToBoxAdapter(
            child: InkWell(
              onTap: () {},
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
        ],
      ),
    );
  }
}
