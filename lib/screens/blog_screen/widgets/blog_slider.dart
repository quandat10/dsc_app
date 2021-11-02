import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/icons/my_flutter_app_icons.dart';
import 'package:dsc_app/screens/blog_screen/widgets/blog_detail_screen.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BlogSlider extends StatefulWidget {
  final List<String> images;

  BlogSlider(this.images);

  @override
  State<BlogSlider> createState() => _BlogSliderState();
}

class _BlogSliderState extends State<BlogSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimationLimiter(
          child: CarouselSlider(
            items: widget.images
                .map((e) => AnimationConfiguration.synchronized(
                      duration: const Duration(milliseconds: 500),
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: Builder(builder: (context) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => BlogDetailScreen()));
                              },
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    width:
                                        MediaQuery.of(context).size.width - 16,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(28),
                                      child: CachedNetworkImage(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                16,
                                        height:
                                            MediaQuery.of(context).size.width,
                                        imageUrl: e,
                                        fit: BoxFit.cover,
                                        placeholder: (_, url) => const Center(
                                            child: CircularProgressIndicator()),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(28),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0x700D253C),
                                              offset: Offset(0, 3),
                                              blurRadius: 2),
                                        ]),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    alignment: Alignment.bottomCenter,
                                    height: 200,
                                    width:
                                        MediaQuery.of(context).size.width - 16,
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          'React Hooks là gì? Công dụng của nó?',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 28,
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
                                                imageUrl: HUMAN_PICTURE,
                                                fit: BoxFit.cover,
                                                placeholder: (_, url) =>
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Text.rich(
                                                TextSpan(
                                                    text: 'Tran Tien Anh',
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
                                                          text: '3hrs ago'),
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
                                  Positioned(
                                    top: 20,
                                    right: 20,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xE5FFADAD),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(
                                        MyFlutterApp.mark,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
      count: widget.images.length);
}
