import 'package:dsc_app/models/post.dart';
import 'package:dsc_app/screens/event_page/event_detail_screen.dart';
import 'package:dsc_app/screens/news_page/news_detail_screen.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../utils/urls.dart';

class PostsItem extends StatelessWidget {
  final Post newsPost;

  PostsItem(this.newsPost);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 0,
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
            if (newsPost.isEvent)
              Navigator.of(context)
                  .pushNamed(EventDetailScreen.tag, arguments: newsPost);
            else if (newsPost.isRecruitment) {
            } else {
              Navigator.of(context)
                  .pushNamed(NewsDetailScreen.tag, arguments: newsPost);
            }
          },
        ),
      ),
    );
  }
}
