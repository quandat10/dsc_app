import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../widgets/drawer.dart';
import '../widgets/home_screen_logo.dart';
import '../widgets/news_slider.dart';
import '../widgets/catogory_list_view.dart';

class HomeScreen extends StatefulWidget {
  static const ROUTE_NAME = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomedDrawer(),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretch: true,
            backgroundColor: Colors.white,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                CatogoryListView(),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (ctx, i) => InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Show Post'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(ctx).pop(),
                                child: Text('OK'),
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
                            child: Image.network(
                                'https://scontent.fhan3-4.fna.fbcdn.net/v/t1.6435-9/213722001_490471052304887_7731603353795101882_n.png?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=3ZEegaA0mTcAX-2k48Z&_nc_ht=scontent.fhan3-4.fna&oh=8d4c918f56e3c58fa8a7c509a5454ef4&oe=617D56EB'),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
