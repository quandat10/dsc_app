import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dsc_app/apis/device_entry_api.dart';
import 'package:dsc_app/models/event/event_model.dart';
import 'package:dsc_app/providers/blogs_provider.dart';
import 'package:dsc_app/providers/events_provider.dart';
import 'package:dsc_app/providers/tabs_navigation_provider.dart';
import 'package:dsc_app/screens/home_page/home_screen.dart';
import 'package:dsc_app/screens/products_screen/products_screen.dart';
import 'package:dsc_app/screens/save_screen/save_screen.dart';
import 'package:dsc_app/screens/doc_screen/doc_screen.dart';
import 'package:dsc_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'blog_screen/blog_screen.dart';
import 'event_screen/event_screen.dart';
import 'info_screen/info_screen.dart';
import 'member_screen/member_screen.dart';

class TabsScreen extends StatefulWidget {
  static const tag = '/tabs';

  TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      Provider.of<EventsProvider>(context, listen: false)
          .getEventListFromDevice();
      Provider.of<BlogsProvider>(context, listen: false)
          .getBlogListFromDevice();
    });
    setEntryTime();
    super.initState();
  }

  void setEntryTime() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      await DeviceEntryApi().updateDeviceFirstEntryCheck(
          deviceID: androidInfo.androidId as String);
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      await DeviceEntryApi().updateDeviceFirstEntryCheck(
          deviceID: iosInfo.identifierForVendor as String);
    }
  }

  final _screenList = [
    HomeScreen(),
    DocScreen(),
    EventScreen(),
    BlogScreen(),
    SaveScreen(),
    MemberScreen(),
    ProductsScreen(),
    InfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final tabsNavigationProvider = Provider.of<TabsNavigationProvider>(context);
    var pageController = tabsNavigationProvider.pageController;
    var setSelectedScreenIndex = tabsNavigationProvider.setSelectedScreenIndex;
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
          title: GestureDetector(
            onTap: () {
              pageController.jumpToPage(0);
            },
            child: Container(
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
        body: PageView.builder(
          onPageChanged: (index) {
            setSelectedScreenIndex(index);
          },
          controller: pageController,
          itemCount: _screenList.length,
          itemBuilder: (context, index) => _screenList[index],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
