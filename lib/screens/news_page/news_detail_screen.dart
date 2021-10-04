import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../models/post.dart';
import '../../widgets/news_slider.dart';

class NewsDetailScreen extends StatelessWidget {
  static const tag = '/news-detail';

  const NewsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    final newsPost = ModalRoute.of(context)!.settings.arguments as Post;

    return Scaffold(
        backgroundColor: BACK_GROUND_COLOR,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: BACK_GROUND_COLOR,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: newsPost.images[0],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (ctx, url) => CircularProgressIndicator(),
                      errorWidget: (ctx, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                Text(
                  newsPost.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                ),
                Divider(
                  height: 30,
                ),
                Text(
                  newsPost.description,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                NewsSlider(newsPost.images),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
