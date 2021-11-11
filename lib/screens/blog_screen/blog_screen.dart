import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:dsc_app/apis/blogs_api.dart';
import 'package:dsc_app/models/blogs/blog_model.dart';
import 'package:dsc_app/models/blogs/tag_model.dart';
import 'package:dsc_app/screens/blog_screen/widgets/blog_slider.dart';
import 'package:dsc_app/screens/blog_screen/widgets/posts_item.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BlogScreen extends StatefulWidget {
  BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  List<String> _filters = ['Tất cả'];
  int _chosenFilter = 0;
  bool checkRefresh = true;
  PagingController<int, BlogModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    getAllTags();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey, _chosenFilter);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey, int _chosenFilter) async {
    try {
      final newItems = await BlogsApi()
          .getBlogsByTag(_filters[_chosenFilter], pageKey: pageKey);
      final isLastPage = newItems.length < 20;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  void getAllTags() async {
    List<TagModel> _tags = [];
    await BlogsApi().getTags().then((value) => _tags = value);
    for (int i = 0; i < _tags.length; i++) {
      _filters.add(_tags[i].name);
    }
    setState(() {});
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                'Blog',
                style: TextStyle(
                    fontSize: 36,
                    color: ERROR_COLOR,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.72),
              ),
            ),
            FutureBuilder(
              future: BlogsApi().getBlogs(numberMode: GetNumber.Limited),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  List<BlogModel> blogs = snapshot.data as List<BlogModel>;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: BlogSlider(
                      blogs,
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            ChipsChoice<int>.single(
              value: _chosenFilter,
              onChanged: (val) {
                if (_chosenFilter != val) {
                  setState(() {
                    _chosenFilter = val;
                  });
                  _pagingController.refresh();
                }
              },
              choiceItems: C2Choice.listFrom<int, String>(
                  source: _filters, value: (i, v) => i, label: (i, v) => v),
              scrollPhysics: BouncingScrollPhysics(),
              choiceActiveStyle: C2ChoiceStyle(
                color: PRIMARY_COLOR,
                showCheckmark: false,
                brightness: Brightness.dark,
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 1),
              ),
              choiceStyle: C2ChoiceStyle(
                showCheckmark: false,
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 1),
                disabledColor: PRIMARY_COLOR,
                color: MAIN_COLOR,
                brightness: Brightness.dark,
              ),
              placeholder: 'Loading',
            ),
            PagedListView<int, BlogModel>(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<BlogModel>(
                newPageProgressIndicatorBuilder: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                itemBuilder: (context, item, index) =>
                    AnimationConfiguration.staggeredList(
                  duration: const Duration(milliseconds: 500),
                  position: index,
                  child: ScaleAnimation(
                    child: FadeInAnimation(child: PostsItem(item)),
                  ),
                ),
              ),
            ),
            // FutureBuilder(
            //   future: BlogsApi()
            //       .getBlogsByTag(_filters[_chosenFilter], pageKey: 0),
            //   builder: (_, snapshotByTag) {
            //     if (snapshotByTag.hasData) {
            //       List<BlogModel> _filteredBlogs =
            //           snapshotByTag.data as List<BlogModel>;
            //       if (_filteredBlogs.isNotEmpty) {
            //         return AnimationLimiter(
            //           child: ListView.builder(
            //             shrinkWrap: true,
            //             physics: NeverScrollableScrollPhysics(),
            //             itemCount: _filteredBlogs.length,
            //             itemBuilder: (_, index) =>
            //                 AnimationConfiguration.staggeredList(
            //                     duration:
            //                         const Duration(milliseconds: 500),
            //                     position: index,
            //                     child: ScaleAnimation(
            //                         child: FadeInAnimation(
            //                             child: PostsItem(
            //                                 _filteredBlogs[index])))),
            //           ),
            //         );
            //       } else {
            //         return Container(
            //           height: 100,
            //           width: double.infinity,
            //           alignment: Alignment.center,
            //           child: Text('Không có bài viết liên quan'),
            //         );
            //       }
            //     } else {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
