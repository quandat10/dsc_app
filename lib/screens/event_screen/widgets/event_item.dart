import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/icons/my_flutter_app_icons.dart';
import 'package:dsc_app/screens/event_screen/event_detail_screen.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventItem extends StatelessWidget {
  const EventItem({Key? key}) : super(key: key);

  Widget _subText(IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: SECONDARY_DECENT,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: SECONDARY_DECENT),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => EventDetailScreen(),));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color(0xff005c7e).withOpacity(0.05),
                offset: Offset(0, 10),
                blurRadius: 5)
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      fit: BoxFit.fitHeight,
                      imageUrl: TEST_EVENT_SCREEN_IMAGE,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xE5FFADAD),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '10',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Text(
                          'June',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xE5FFADAD),
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      MyFlutterApp.mark,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Workshop Học máy và Trí tuệ nhân tạo',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _subText(FontAwesomeIcons.clock, 'Thứ Ba, 12/12/2021'),
                  SizedBox(
                    height: 10,
                  ),
                  _subText(Icons.add_location,
                      '6 Hoàng Diệu, Quán Thánh, Ba Đình, Hà Nội'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
