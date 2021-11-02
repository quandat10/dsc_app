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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              width: double.infinity,
              height: 250,
              child: CachedNetworkImage(
                fit: BoxFit.fitHeight,
                imageUrl: TEST_EVENT_SCREEN_IMAGE,
              ),
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
          ),
          Positioned(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
            ),
            bottom: 0,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}
