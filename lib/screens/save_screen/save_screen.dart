import 'package:dsc_app/models/blogs/blog_model.dart';
import 'package:dsc_app/models/event/event_model.dart';
import 'package:dsc_app/providers/blogs_provider.dart';
import 'package:dsc_app/providers/events_provider.dart';
import 'package:dsc_app/screens/blog_screen/widgets/posts_item.dart';
import 'package:dsc_app/screens/event_screen/widgets/event_item.dart';
import 'package:dsc_app/screens/save_screen/extended_event_save_screen.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'extended_blog_save_screen.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  Widget _textHeaderItem(String title, void Function() function) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.42,
              color: SECONDARY_COLOR,
            ),
          ),
          InkWell(
            onTap: function,
            highlightColor: PRIMARY_COLOR,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: const Text(
                      'Xem thêm',
                      style: TextStyle(
                          fontSize: 12,
                          color: PRIMARY_COLOR,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/arrow.svg',
                    color: PRIMARY_COLOR,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var savedEvents = Provider.of<EventsProvider>(context)
        .savedEvents
        .reversed
        .toList();
    var savedBlogs = Provider.of<BlogsProvider>(context)
        .savedBlogs
        .reversed
        .toList();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: const Text(
                'Đã lưu',
                style: TextStyle(
                    fontSize: 36,
                    color: ERROR_COLOR,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.72),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _textHeaderItem('Blog', () {
                  Navigator.of(context).pushNamed(ExtendedBlogSaveScreen.tag,
                      arguments: savedBlogs);
                })),
            const SizedBox(height: 15),
            savedBlogs.isEmpty
                ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                'Chưa có bài viết được lưu!',
                style:
                TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              ),
            )
                : ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: savedBlogs.length > 2 ? 2 : savedBlogs.length,
              itemBuilder: (_, index) => PostsItem(savedBlogs[index])),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _textHeaderItem('Sự kiện', () {
                  Navigator.of(context).pushNamed(ExtendedEventSaveScreen.tag,
                      arguments: savedEvents);
                })),
            const SizedBox(height: 15),
            savedEvents.isEmpty
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Chưa có sự kiện được lưu!',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: savedEvents.length > 2 ? 2 : savedEvents.length,
                    itemBuilder: (_, index) => EventItem(savedEvents[index]))
          ],
        ),
      ),
    );
  }
}
