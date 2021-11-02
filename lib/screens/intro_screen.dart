import 'package:dsc_app/screens/tabs_screen.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'home_page/home_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<PageViewModel> get _introPages {
    return [
      PageViewModel(
        decoration: PageDecoration(
          imagePadding: EdgeInsets.only(top: 20),
          descriptionPadding: const EdgeInsets.all(0),
          contentMargin: const EdgeInsets.all(0),
          imageFlex: 2,
          bodyFlex: 1,
          bodyAlignment: Alignment.bottomCenter,
        ),
        titleWidget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
              color: PRIMARY_COLOR, borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Text(
                'Khám phá những sự kiện công nghệ mới nhất',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sử dụng app GDSC-HUST để có thể cập nhật những sự kiện công nghệ hấp dẫn nhất!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        body: '',
        image: Image(
          image: AssetImage('assets/images/event_screen.png'),
        ),
      ),
      PageViewModel(
        decoration: PageDecoration(
          imagePadding: EdgeInsets.only(top: 20),
          descriptionPadding: const EdgeInsets.all(0),
          contentMargin: const EdgeInsets.all(0),
          imageFlex: 2,
          bodyFlex: 1,
          bodyAlignment: Alignment.bottomCenter,
        ),
        titleWidget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
              color: PRIMARY_COLOR, borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Text(
                'Học hỏi thêm từ những bài viết bổ ích',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Với app GDSC-HUST bạn sẽ dễ dàng lưu lại những bài viết chia sẻ kiến thức ngắn gọn, siêu thú vị và cực kỳ hữu ích!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        body: '',
        image: Image(
          image: AssetImage('assets/images/blog_screen.png'),
        ),
      ),
      PageViewModel(
        decoration: PageDecoration(
          imagePadding: EdgeInsets.only(top: 20),
          descriptionPadding: const EdgeInsets.all(0),
          contentMargin: const EdgeInsets.all(0),
          imageFlex: 2,
          bodyFlex: 1,
          bodyAlignment: Alignment.bottomCenter,
        ),
        titleWidget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
              color: PRIMARY_COLOR, borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Text(
                'Gặp gỡ những thành viên năng động, tài năng đến từ GDSC-HUST',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Bạn sẽ được kết nối và gặp gỡ những thành viên đáng yêu, dễ thương và giỏi cực kỳ đó!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        body: '',
        image: Image(
          image: AssetImage('assets/images/member_screen.png'),
        ),
      ),
    ];
  }

  void _goToHomeScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(TabsScreen.tag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        dotsContainerDecorator: BoxDecoration(color: PRIMARY_COLOR),
        curve: Curves.bounceInOut,
        globalBackgroundColor: Colors.white,
        dotsDecorator: DotsDecorator(
            activeColor: Colors.white, color: Colors.white.withOpacity(0.3)),
        pages: _introPages,
        next: Text(
          'Tiếp tục',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        skip: Text(
          'Bỏ qua',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        done: Text(
          'Kết thúc',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        showSkipButton: true,
        onSkip: () => _goToHomeScreen(context),
        onDone: () => _goToHomeScreen(context),
      ),
    );
  }
}
