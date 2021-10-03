import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsSlider extends StatelessWidget {
  NewsSlider({Key? key}) : super(key: key);

  final List<String> newsImages = [
    'https://scontent.fhan3-4.fna.fbcdn.net/v/t1.6435-9/213722001_490471052304887_7731603353795101882_n.png?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=3ZEegaA0mTcAX-2k48Z&_nc_ht=scontent.fhan3-4.fna&oh=8d4c918f56e3c58fa8a7c509a5454ef4&oe=617D56EB',
    'https://scontent.fhan3-4.fna.fbcdn.net/v/t1.6435-9/213722001_490471052304887_7731603353795101882_n.png?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=3ZEegaA0mTcAX-2k48Z&_nc_ht=scontent.fhan3-4.fna&oh=8d4c918f56e3c58fa8a7c509a5454ef4&oe=617D56EB',
    'https://scontent.fhan3-4.fna.fbcdn.net/v/t1.6435-9/213722001_490471052304887_7731603353795101882_n.png?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=3ZEegaA0mTcAX-2k48Z&_nc_ht=scontent.fhan3-4.fna&oh=8d4c918f56e3c58fa8a7c509a5454ef4&oe=617D56EB',
    'https://scontent.fhan3-4.fna.fbcdn.net/v/t1.6435-9/213722001_490471052304887_7731603353795101882_n.png?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=3ZEegaA0mTcAX-2k48Z&_nc_ht=scontent.fhan3-4.fna&oh=8d4c918f56e3c58fa8a7c509a5454ef4&oe=617D56EB',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: newsImages
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
                          child: Image.network(
                            e,
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
          //autoPlay: true,
        ));
  }
}
