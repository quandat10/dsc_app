import 'package:dsc_app/models/blogs/blog_model.dart';
import 'package:dsc_app/models/event/event_model.dart';
import 'package:dsc_app/screens/blog_screen/widgets/posts_item.dart';
import 'package:dsc_app/screens/event_screen/widgets/event_item.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExtendedBlogSaveScreen extends StatefulWidget {
  static const tag = 'extended-blog-save';

  const ExtendedBlogSaveScreen({Key? key}) : super(key: key);

  @override
  State<ExtendedBlogSaveScreen> createState() => _ExtendedBlogSaveScreenState();
}

class _ExtendedBlogSaveScreenState extends State<ExtendedBlogSaveScreen> {
  @override
  Widget build(BuildContext context) {
    var savedBlogs =
        ModalRoute.of(context)!.settings.arguments as List<BlogModel>;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background_image.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          title: Container(
            //margin: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Google Developer Student Clubs',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Hanoi University of Science and Technology',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/bell.svg',
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
                child: Text(
                  'Blog',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.42,
                    color: SECONDARY_COLOR,
                  ),
                ),
              ),
              savedBlogs.isEmpty
                  ? Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Chưa có bài viết được lưu!',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: savedBlogs.length,
                      itemBuilder: (_, index) => PostsItem(savedBlogs[index]))
            ],
          ),
        ),
      ),
    );
  }
}
