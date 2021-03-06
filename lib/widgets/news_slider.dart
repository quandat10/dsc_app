import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/models/event/event_model.dart';
import 'package:dsc_app/screens/event_screen/event_detail_screen.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsSlider extends StatefulWidget {
  final List<EventModel> events;

  NewsSlider(this.events);

  @override
  State<NewsSlider> createState() => _NewsSliderState();
}

class _NewsSliderState extends State<NewsSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimationLimiter(
          child: CarouselSlider(
            items: widget.events
                .map((e) => AnimationConfiguration.synchronized(
                      duration: const Duration(milliseconds: 500),
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: Builder(builder: (context) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    EventDetailScreen.tag,
                                    arguments: e);
                              },
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    width: 400,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(28),
                                      child: CachedNetworkImage(
                                        width: 400,
                                        height: 250,
                                        imageUrl: e.imageUrl,
                                        fit: BoxFit.cover,
                                        placeholder: (_, url) => const Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
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
                                    height: 150,
                                    width: 400,
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
                                    child: Text(
                                      e.title,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              height: 250,
              initialPage: 0,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.events.length,
        effect: SlideEffect(
            spacing: 8.0,
            radius: 4.0,
            dotWidth: 10,
            dotHeight: 10,
            dotColor: Colors.grey,
            activeDotColor: ERROR_COLOR),
      );
}
