import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'home_page/home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  List<PageViewModel> get _introPages {
    const testImage =
        'https://scontent.fhan3-4.fna.fbcdn.net/v/t1.6435-9/213722001_490471052304887_7731603353795101882_n.png?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=3ZEegaA0mTcAX-2k48Z&_nc_ht=scontent.fhan3-4.fna&oh=8d4c918f56e3c58fa8a7c509a5454ef4&oe=617D56EB';
    return [
      PageViewModel(
        title: 'Welcome to DSC-HUST club',
        body: 'This is DSC app',
        image: CachedNetworkImage(
          imageUrl: testImage,
          errorWidget: (ctx, url, error) => const Icon(Icons.error),
        ),
      ),
      PageViewModel(
        title: 'Welcome to DSC-HUST club',
        body: 'This is DSC app',
        image: CachedNetworkImage(
          imageUrl: testImage,
          errorWidget: (ctx, url, error) => const Icon(Icons.error),
        ),
      ),
      PageViewModel(
        title: 'Welcome to DSC-HUST club',
        body: 'This is DSC app',
        image: CachedNetworkImage(
          imageUrl: testImage,
          errorWidget: (ctx, url, error) => const Icon(Icons.error),
        ),
      ),
      PageViewModel(
        title: 'Welcome to DSC-HUST club',
        body: 'This is DSC app',
        image: CachedNetworkImage(
          imageUrl: testImage,
          errorWidget: (ctx, url, error) => const Icon(Icons.error),
        ),
      ),
    ];
  }

  void _goToHomeScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(HomeScreen.tag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        curve: Curves.bounceInOut,
        globalBackgroundColor: Colors.white,
        pages: _introPages,
        next: Text('Next'),
        skip: Text('Skip'),
        done: Text('Done'),
        showSkipButton: true,
        onSkip: () => _goToHomeScreen(context),
        onDone: () => _goToHomeScreen(context),
      ),
    );
  }
}
