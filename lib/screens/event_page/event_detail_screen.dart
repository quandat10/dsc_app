import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../models/post.dart';
import '../../widgets/news_slider.dart';

class EventDetailScreen extends StatelessWidget {
  static const tag = '/event-detail';

  const EventDetailScreen({Key? key}) : super(key: key);

  Widget _rowWidget(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    final event = ModalRoute.of(context)!.settings.arguments as Post;

    return Scaffold(
        backgroundColor: BACK_GROUND_COLOR,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: BACK_GROUND_COLOR,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.alarm))],
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
                      imageUrl: event.images[0],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (ctx, url) => CircularProgressIndicator(),
                      errorWidget: (ctx, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                _rowWidget(Icons.calendar_today, event.dateTime),
                Text(
                  event.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                ),
                _rowWidget(Icons.add_location, event.location),
                Divider(
                  height: 30,
                ),
                Text(
                  event.description,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Đăng ký ngay'),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                NewsSlider(event.images),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
