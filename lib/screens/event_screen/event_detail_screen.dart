import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/models/event/event_model.dart';
import 'package:dsc_app/providers/events_provider.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../web_view_screen.dart';

class EventDetailScreen extends StatelessWidget {
  static const tag = '/event-detail';

  const EventDetailScreen({Key? key}) : super(key: key);

  Widget _descriptionItem(
      {required String title,
      required String subtitle,
      required IconData icon}) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFFEABDE8).withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: PRIMARY_COLOR,
            size: 23,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF747688)),
            )
          ],
        )
      ],
    );
  }

  Widget _eventInfoItem(String text, String info) {
    return Text.rich(
      TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: info,
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w400, height: 1.5),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _event = ModalRoute.of(context)!.settings.arguments as EventModel;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              automaticallyImplyLeading: true,
              iconTheme: IconThemeData(color: Colors.white),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
              title: Text(
                'SỰ KIỆN',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1,
                    color: Colors.white),
              ),
              actions: [
                Consumer<EventsProvider>(
                  builder: (context, data, child) {
                    return IconButton(
                      onPressed: () {
                        data.savedEvents
                                .any((element) => element.id == _event.id)
                            ? data.removeEventFromList(_event)
                            : data.addEventToSaveList(_event);
                      },
                      icon: Icon(
                        data.savedEvents
                                .any((element) => element.id == _event.id)
                            ? FontAwesomeIcons.solidBookmark
                            : FontAwesomeIcons.bookmark,
                        size: 20,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
              expandedHeight: 210,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: SizedBox(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: SizedBox(
                          width: double.infinity,
                          height: 240,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: _event.imageUrl,
                            placeholder: (_, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 240,
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
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _event.title,
                      style: TextStyle(
                          color: ERROR_COLOR,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _descriptionItem(
                        title: DateFormat.yMEd()
                            .format(DateTime.parse(_event.time)),
                        subtitle:
                            DateFormat.jm().format(DateTime.parse(_event.time)),
                        icon: FontAwesomeIcons.calendar),
                    const SizedBox(
                      height: 10,
                    ),
                    _descriptionItem(
                        title: _event.location.name,
                        subtitle: _event.location.address,
                        icon: Icons.add_location),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Thông tin sự kiện:',
                      style: TextStyle(
                        color: ERROR_COLOR,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (_event.guests.isNotEmpty)
                      const SizedBox(
                        height: 10,
                      ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Diễn giả/Khách mời: ',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            )),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ..._event.guests
                                  .map((e) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text.rich(TextSpan(
                                              text: e.name,
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              children: [
                                                TextSpan(text: ' - ${e.role}'),
                                                if (e.company != '')
                                                  TextSpan(
                                                      text: ' - ${e.company}')
                                              ])),
                                          const SizedBox(
                                            height: 5,
                                          )
                                        ],
                                      ))
                                  .toList()
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (_event.description.substring(0, 4) != '<div')
                      _eventInfoItem('Mô tả: ', _event.description),
                    if (_event.description.substring(0, 4) == '<div')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mô tả: ',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              )),
                          Html(
                              data: _event.description,
                              onLinkTap: (url, _context, attributes, element) {
                                showCupertinoDialog(
                                    context: context,
                                    builder: (ctx) => CupertinoAlertDialog(
                                          title: Text('Chuyển tiếp'),
                                          content: Text(
                                              'Bạn đang được chuyển tiếp sang trang khác...'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          WebViewScreen.tag,
                                                          arguments: url);
                                                },
                                                child: Text('Đồng ý')),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Text('Hủy bỏ')),
                                          ],
                                        ));
                              })
                        ],
                      ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () async {
                          if (_event.eventUrl.info == '') {
                            Fluttertoast.showToast(
                                msg: 'Sự kiện hiện tại chưa có link!',
                                timeInSecForIosWeb: 2,
                                gravity: ToastGravity.CENTER);
                          } else {
                            await launch(_event.eventUrl.info);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: PRIMARY_COLOR, width: 1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            'Xem thêm',
                            style: TextStyle(
                                color: ERROR_COLOR,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () async {
                          if (_event.eventUrl.register == '') {
                            Fluttertoast.showToast(
                                msg: 'Sự kiện hiện tại chưa có link đăng ký!',
                                timeInSecForIosWeb: 2,
                                gravity: ToastGravity.CENTER);
                          } else {
                            await launch(_event.eventUrl.register);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: GRADIENT_01),
                          child: Text(
                            'Đăng ký',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
