import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/models/blogs/blog_model.dart';
import 'package:dsc_app/providers/blogs_provider.dart';
import 'package:dsc_app/screens/blog_screen/blog_detail_screen.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class BlogSlider extends StatefulWidget {
  final List<BlogModel> blogs;

  BlogSlider(this.blogs);

  @override
  State<BlogSlider> createState() => _BlogSliderState();
}

class _BlogSliderState extends State<BlogSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final blogsProvider = Provider.of<BlogsProvider>(context);
    var savedBlogs = blogsProvider.savedBlogs;
    return Column(
      children: [
        AnimationLimiter(
          child: CarouselSlider(
            items: widget.blogs
                .map((e) => AnimationConfiguration.synchronized(
                      duration: const Duration(milliseconds: 500),
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: Builder(builder: (context) {
                            return Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        BlogDetailScreen.tag,
                                        arguments: e.id);
                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                16,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          child: CachedNetworkImage(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                16,
                                            height: MediaQuery.of(context)
                                                .size
                                                .width,
                                            imageUrl: e.thumbnailImgUrl,
                                            fit: BoxFit.cover,
                                            placeholder: (_, url) => const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(28),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0x700D253C),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 2),
                                            ]),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        alignment: Alignment.bottomCenter,
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                16,
                                        padding: const EdgeInsets.all(13),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0x000D253C),
                                              Color(0xff0D253C)
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(28),
                                              bottomRight: Radius.circular(28)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                e.title,
                                                maxLines: 2,
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 28,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(45),
                                                  child: CachedNetworkImage(
                                                    height: 29,
                                                    width: 29,
                                                    imageUrl: e.coverImgUrl,
                                                    fit: BoxFit.cover,
                                                    placeholder: (_, url) =>
                                                        CircularProgressIndicator(),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: Text.rich(
                                                    TextSpan(
                                                        text: e.authorName,
                                                        style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(0.6),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        children: [
                                                          TextSpan(text: ' - '),
                                                          TextSpan(
                                                              text: timeago.format(
                                                                  DateTime.parse(
                                                                      e.timeCreate))),
                                                        ]),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            _buildIndicator(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  right: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      savedBlogs.any(
                                              (element) => element.id == e.id)
                                          ? blogsProvider.removeBlogFromList(e)
                                          : blogsProvider.addBlogToSaveList(e);
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xE5FFADAD),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(
                                        savedBlogs.any(
                                                (element) => element.id == e.id)
                                            ? FontAwesomeIcons.solidBookmark
                                            : FontAwesomeIcons.bookmark,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              autoPlayCurve: Curves.fastOutSlowIn,
              height: MediaQuery.of(context).size.width,
              initialPage: 0,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              scrollPhysics: BouncingScrollPhysics(),
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
              viewportFraction: (MediaQuery.of(context).size.width - 32) /
                  (MediaQuery.of(context).size.width),
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator() => AnimatedSmoothIndicator(
      effect: SlideEffect(
          spacing: 8.0,
          radius: 4.0,
          dotWidth: 35.0,
          dotHeight: 4,
          dotColor: Colors.grey,
          activeDotColor: Colors.white),
      activeIndex: activeIndex,
      count: widget.blogs.length);
}
