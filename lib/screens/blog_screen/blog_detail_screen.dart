import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/apis/blogs_api.dart';
import 'package:dsc_app/models/blogs/blog_detail_model.dart';
import 'package:dsc_app/models/blogs/blog_model.dart';
import 'package:dsc_app/providers/blogs_provider.dart';
import 'package:dsc_app/screens/blog_screen/widgets/posts_item.dart';
import 'package:dsc_app/screens/web_view_screen.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class BlogDetailScreen extends StatefulWidget {
  static const tag = '/blog-detail';

  const BlogDetailScreen({Key? key}) : super(key: key);

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  bool isFirstLaunch = true;
  var id = -1;
  BlogModel _blog = BlogModel(
      id: -1,
      authorName: '',
      timeRelease: '',
      timeCreate: '',
      title: '',
      subTitle: '',
      coverImgUrl: '',
      thumbnailImgUrl: '',
      blogTag: []);

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
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    if (isFirstLaunch) {
      id = ModalRoute.of(context)!.settings.arguments as int;
      BlogsApi().getBlogsById(id).then((value) => _blog = value);
    }
    setState(() {
      isFirstLaunch = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: BlogsApi().getBlogDetails(id),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              BlogDetailModel blog = snapshot.data as BlogDetailModel;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    forceElevated: true,
                    iconTheme: IconThemeData(color: Colors.white),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                    actions: [
                      Consumer<BlogsProvider>(
                        builder: (context, data, child) {
                          return IconButton(
                            onPressed: () {
                              data.savedBlogs
                                      .any((element) => element.id == _blog.id)
                                  ? data.removeBlogFromList(_blog)
                                  : data.addBlogToSaveList(_blog);
                            },
                            icon: Icon(
                              data.savedBlogs
                                      .any((element) => element.id == _blog.id)
                                  ? FontAwesomeIcons.solidBookmark
                                  : FontAwesomeIcons.bookmark,
                              size: 24,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ],
                    expandedHeight: 210,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Stack(
                        children: [
                          CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: blog.thumbnailImgUrl,
                            width: MediaQuery.of(context).size.width,
                            height: 240,
                            placeholder: (_, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
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
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              ...blog.blogTag.map(
                                (e) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: PRIMARY_COLOR,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    e.trim(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            blog.title,
                            style: TextStyle(
                                color: ERROR_COLOR,
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(45),
                                child: CachedNetworkImage(
                                  height: 29,
                                  width: 29,
                                  imageUrl: blog.coverImgUrl,
                                  fit: BoxFit.cover,
                                  placeholder: (_, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text.rich(
                                  TextSpan(
                                      text: blog.authorName,
                                      style: TextStyle(
                                        color:
                                            Color(0xffF485899).withOpacity(0.6),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: [
                                        TextSpan(text: ' - '),
                                        TextSpan(
                                            text: timeago.format(DateTime.parse(
                                                blog.timeRelease))),
                                      ]),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            blog.subTitle,
                            style: TextStyle(
                                color: MAIN_COLOR,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Html(
                              data: blog.rawContent,
                              style: {
                                "body": Style(
                                    margin: EdgeInsets.zero,
                                    padding: EdgeInsets.zero,
                                    fontFamily: 'Inter'),
                                "h1": Style(
                                    fontSize: FontSize.xxLarge,
                                    fontWeight: FontWeight.bold,
                                    margin: const EdgeInsets.only(bottom: 16)),
                                "h2": Style(
                                    fontSize: FontSize.xLarge,
                                    fontWeight: FontWeight.bold,
                                    margin: const EdgeInsets.only(bottom: 16)),
                                "p": Style(
                                    fontSize: FontSize.large,
                                    margin: const EdgeInsets.only(bottom: 16),
                                    lineHeight: LineHeight.rem(1.5),
                                    color: Colors.black),
                                "figure": Style(
                                    fontSize: FontSize.medium,
                                    color: Colors.grey,
                                    margin: const EdgeInsets.all(32),
                                    textAlign: TextAlign.center),
                                "code": Style(color: Colors.cyan.shade700),
                                "pre": Style(
                                  backgroundColor: Color(0xFF202020),
                                  padding: const EdgeInsets.all(16),
                                  margin: const EdgeInsets.all(16),
                                ),
                                "blockquote": Style(
                                  backgroundColor: Color(0xFFE6E6FA),
                                  padding: const EdgeInsets.all(16),
                                  margin: const EdgeInsets.all(16),
                                  border: Border(
                                    left: BorderSide(
                                      width: 5,
                                      style: BorderStyle.solid,
                                      color: Color(0xFF005c7e),
                                    ),
                                  ),
                                ),
                                "table": Style(
                                  margin: const EdgeInsets.all(16),
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                "th": Style(backgroundColor: Color(0xFFF5F5F5)),
                                "th, td": Style(
                                    padding: const EdgeInsets.all(16),
                                    border: Border.all(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.grey)),
                                "a": Style(color: Colors.blue),
                              },
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
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Bài viết liên quan',
                            style: TextStyle(
                                color: ERROR_COLOR,
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1),
                          ),
                          FutureBuilder(
                            future: BlogsApi().getBlogsByTag(blog.blogTag[0],
                                pageKey: 0, pageSize: 5),
                            builder: (_, snapshotByTag) {
                              if (snapshotByTag.hasData) {
                                List<BlogModel> _latestBlogs =
                                    snapshotByTag.data as List<BlogModel>;
                                return AnimationLimiter(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: _latestBlogs.length,
                                    itemBuilder: (_, index) =>
                                        AnimationConfiguration.staggeredList(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            position: index,
                                            child: ScaleAnimation(
                                                child: FadeInAnimation(
                                                    child: PostsItem(
                                                        _latestBlogs[index])))),
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
