import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/screens/event_page/event_detail_screen.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/strings.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/drawer.dart';
import '../../models/post.dart';

class EventScreen extends StatefulWidget {
  static const tag = '/event';

  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<Events>(context).events;
    return Scaffold(
      drawer: CustomedDrawer(),
      backgroundColor: BACK_GROUND_COLOR,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: BACK_GROUND_COLOR,
        centerTitle: true,
        title: Text(TITLE_EVENTS,
            style: TextStyle(color: Colors.black87, fontSize: 18)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: events.length,
              itemBuilder: (context, index) {
                return itemPosts(events[index], index);
              }),
        ),
      ),
    );
  }

  Widget itemPosts(Post event, int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(EventDetailScreen.tag, arguments: event);
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          margin: EdgeInsets.only(
              top: index == 0 ? 15 : 5, bottom: index == 9 ? 15 : 5),
          decoration: BoxDecoration(
              color: ITEM_POST_COLOR, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                    imageUrl: event.images[0],
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
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(event.title,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(event.description.substring(0, 100) + '...',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
