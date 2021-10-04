import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/strings.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer.dart';

class EventScreen extends StatefulWidget {
  static const tag = '/event';
  const EventScreen({Key? key}) : super(key: key);
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomedDrawer(),
      backgroundColor: BACK_GROUND_COLOR,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: BACK_GROUND_COLOR,
        centerTitle: true,
        title: Text(TITLE_EVENT,
            style: TextStyle(color: Colors.black87, fontSize: 18)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return itemEvents(index);
              }),
        ),
      ),
    );
  }

  Widget itemEvents(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          margin: EdgeInsets.only(
              top: index == 0 ? 15 : 5, bottom: index == 9 ? 15 : 5),
          decoration: BoxDecoration(
              color: ITEM_EVENT_COLOR, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  height: 50,
                  width: 50,
                  imageUrl: THUMBNAIL_IMAGE_HOMEPAGE_URL,
                  placeholder: (context, url) => Center(
                    child: SizedBox(
                      width: 30.0,
                      height: 30.0,
                      child: new CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Event ${index + 1}',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text('This is short Description',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
