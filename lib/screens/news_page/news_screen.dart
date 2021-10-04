import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/screens/event_page/event_detail_screen.dart';
import 'package:dsc_app/screens/home_page/widgets/category_list_view.dart';
import 'package:dsc_app/screens/news_page/news_detail_screen.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/strings.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/drawer.dart';
import '../../models/post.dart';

class NewsScreen extends StatefulWidget {
  static const tag = '/news';

  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<News>(context).news;
    return Scaffold(
      drawer: CustomedDrawer(),
      backgroundColor: BACK_GROUND_COLOR,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: BACK_GROUND_COLOR,
        centerTitle: true,
        title: Text(TITLE_NEWS,
            style: TextStyle(color: Colors.black87, fontSize: 18)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            CategoryListView(),
            SizedBox(
              height: MediaQuery.of(context).size.height - 150,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    return itemPosts(news[index]);
                  }),
            ),
          ]),
        ),
      ),
    );
  }

  Widget itemPosts(Post newsPost) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 3,
        color: ITEM_POST_COLOR,
        child: ListTile(
          title: Text(
            newsPost.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            softWrap: true,
          ),
          subtitle: Text(newsPost.description.substring(0, 100) + '...'),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              imageUrl: newsPost.images[0],
              placeholder: (context, url) => Center(
                child: SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: new CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          onTap: () {
            if(newsPost.isEvent) Navigator.of(context).pushNamed(EventDetailScreen.tag, arguments: newsPost);
            else if(newsPost.isRecruitment){

            }
            else {
              Navigator.of(context).pushNamed(NewsDetailScreen.tag, arguments: newsPost);
            }
          },
        ),
      ),
    );
  }
}
