import 'package:dsc_app/icons/my_flutter_app_icons.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/urls.dart';

class PostsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Color(0xff005c7e).withOpacity(0.05),
              offset: Offset(0, 10),
              blurRadius: 5)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              height: 92,
              width: 92,
              imageUrl: TEST_IMAGE,
              fit: BoxFit.cover,
              placeholder: (_, url) => CircularProgressIndicator(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        height: 16,
                        width: 16,
                        imageUrl: HUMAN_PICTURE,
                        fit: BoxFit.cover,
                        placeholder: (_, url) => CircularProgressIndicator(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: const Text(
                        'Tran Tien Anh',
                        style: TextStyle(
                          color: MAIN_COLOR,
                          fontSize: 14,
                          letterSpacing: -1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5,),
                const Text(
                  'React Hooks là gì? Công dụng của nó?',
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    overflow: TextOverflow.fade,
                    color: SECONDARY_COLOR,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.clock,
                      size: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: const Text('1hr ago'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.02,
            child: IconButton(
              icon: Icon(
                MyFlutterApp.mark,
                size: 14,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
