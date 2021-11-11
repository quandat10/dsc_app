import 'package:dsc_app/screens/tabs_screen.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/images.dart';
import 'package:dsc_app/utils/strings.dart';
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
      pageView(TITLE_INTRO_1,TITLE_CONTENT_1,IMG_EVENT_SCREEN),
      pageView(TITLE_INTRO_2,TITLE_CONTENT_2,IMG_BLOG_SCREEN),
      pageView(TITLE_INTRO_3,TITLE_CONTENT_3,IMG_MEMBER_SCREEN),
    ];
  }

  PageViewModel pageView(String title, String content, String img){
    return PageViewModel(
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
                title,
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
                content,
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
          image: AssetImage(img),
        ),
      );
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
