import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';

class EventBackgroundItem extends StatelessWidget {
  const EventBackgroundItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: CachedNetworkImage(
              fit: BoxFit.fitHeight,
              imageUrl: TEST_EVENT_SCREEN_IMAGE,
            ),
          ),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff0D253C), Color(0x000D253C)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )
        ],
      ),
    );
  }
}
