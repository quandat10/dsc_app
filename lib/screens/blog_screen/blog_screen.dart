import 'package:chips_choice_null_safety/chips_choice.dart';
import 'package:dsc_app/screens/blog_screen/widgets/blog_slider.dart';
import 'package:dsc_app/screens/home_page/widgets/posts_item.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  List<String> _filters = [
    'Tất cả',
    'Web Development',
    'Mobile Development',
    'Trí tuệ nhân tạo',
    'Học máy',
    'Lập trình'
  ];
  int _chosenFilter = 0;

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
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: BlogSlider([
                TEST_EVENT_IMAGE,
                TEST_EVENT_IMAGE,
                TEST_EVENT_IMAGE,
              ]),
            ),
            ChipsChoice<int>.single(
              value: _chosenFilter,
              onChanged: (val) => setState(() {
                _chosenFilter = val;
              }),
              choiceItems: C2Choice.listFrom<int, String>(
                  source: _filters, value: (i, v) => i, label: (i, v) => v),
              scrollPhysics: BouncingScrollPhysics(),
              choiceActiveStyle: C2ChoiceStyle(
                color: MAIN_COLOR,
                showCheckmark: false,
              ),
              choiceStyle: C2ChoiceStyle(
                color: PRIMARY_COLOR,
                brightness: Brightness.dark,
              ),
              placeholder: 'Loading',
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => PostsItem())
          ],
        ),
      ),
    );
  }
}
