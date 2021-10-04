import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsSlider extends StatelessWidget {
  final List<String> images;

  NewsSlider(this.images);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: images
            .map((e) => InkWell(
                  onTap: () {},
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: e,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
        ));
  }
}
