import 'package:dsc_app/icons/my_flutter_app_icons.dart';
import 'package:dsc_app/models/blogs/blog_model.dart';
import 'package:dsc_app/providers/blogs_provider.dart';
import 'package:dsc_app/screens/blog_screen/blog_detail_screen.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostsItem extends StatelessWidget {
  BlogModel blog;

  PostsItem(this.blog);

  @override
  Widget build(BuildContext context) {
    final blogsProvider = Provider.of<BlogsProvider>(context);
    var savedBlogs = blogsProvider.savedBlogs;
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(BlogDetailScreen.tag, arguments: blog.id);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Color(0xff005c7e).withOpacity(0.05),
                    offset: Offset(0, 10),
                    blurRadius: 5)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    height: 92,
                    width: 92,
                    imageUrl: blog.thumbnailImgUrl,
                    fit: BoxFit.cover,
                    placeholder: (_, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: CachedNetworkImage(
                                height: 16,
                                width: 16,
                                imageUrl: blog.coverImgUrl,
                                fit: BoxFit.cover,
                                placeholder: (_, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                blog.authorName,
                                style: TextStyle(
                                  color: MAIN_COLOR,
                                  fontSize: 14,
                                  letterSpacing: -1,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          blog.title,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            overflow: TextOverflow.fade,
                            color: SECONDARY_COLOR,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.clock,
                              size: 14,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                timeago
                                    .format(DateTime.parse(blog.timeCreate)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 15,
          top: 15,
          child: IconButton(
            onPressed: () {
              savedBlogs.any((element) => element.id == blog.id)
                  ? blogsProvider.removeBlogFromList(blog)
                  : blogsProvider.addBlogToSaveList(blog);
            },
            icon: Icon(
              savedBlogs.any((element) => element.id == blog.id)
                  ? FontAwesomeIcons.solidBookmark
                  : FontAwesomeIcons.bookmark,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
