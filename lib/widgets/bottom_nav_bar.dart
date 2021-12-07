import 'package:dsc_app/providers/tabs_navigation_provider.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _isShrink = true;

  Widget _textIconButtonBuilder(
      String iconPath, String title, void Function() function,
      {required int index,
      required int selectedScreenIndex,
      required Function setPageIndex}) {
    var textColor =
        selectedScreenIndex == index ? Colors.white : Colors.transparent;
    return InkWell(
      onTap: () {
        setState(() {
          //widget.selectedScreenIndex = index;
          if (index != 8) {
            setPageIndex(index);
            _isShrink = true;
          }
        });
        function();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPath != 'assets/icons/close.svg')
            SvgPicture.asset(
              iconPath,
              color: Colors.white,
            ),
          if (iconPath == 'assets/icons/close.svg')
            Icon(Iconsax.close_circle, size: 30, color: Colors.white),
          if (selectedScreenIndex == index)
            SizedBox(
              height: 4,
            ),
          if (selectedScreenIndex == index)
            FittedBox(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: index == 8 ? Colors.transparent : textColor),
              ),
            ),
        ],
      ),
    );
  }

  Widget _extendedTextIconButtonBuilder(String iconPath, String title,
      {required int index,
      required int selectedScreenIndex,
      required Function setPageIndex}) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              //widget.selectedScreenIndex = index;
              if (index != 8) {
                setPageIndex(index);
                _isShrink = true;
              }
            });
          },
          icon: SvgPicture.asset(
            iconPath,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 9, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _spacer() {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.home,
            color: Colors.transparent,
          ),
        ),
        Text(
          '',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var setPageIndex =
        Provider.of<TabsNavigationProvider>(context).setPageIndex;
    int selectedScreenIndex =
        Provider.of<TabsNavigationProvider>(context).selectedScreenIndex;
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      height: _isShrink ? size.height * 0.08 : size.height * 0.16,
      width: size.width,
      decoration: BoxDecoration(
        gradient: GRADIENT_01,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(11), topRight: Radius.circular(11)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.08,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.2,
                    child: _textIconButtonBuilder(
                        'assets/icons/home.svg', TITLE_HOME, () {},
                        index: 0,
                        selectedScreenIndex: selectedScreenIndex,
                        setPageIndex: setPageIndex),
                  ),
                  Container(
                    width: size.width * 0.2,
                    child: _textIconButtonBuilder(
                        'assets/icons/doc.svg', TITLE_DOC, () {},
                        index: 1,
                        selectedScreenIndex: selectedScreenIndex,
                        setPageIndex: setPageIndex),
                  ),
                  Container(
                    width: size.width * 0.2,
                    child: _textIconButtonBuilder(
                        'assets/icons/event.svg', TITLE_EVENTS, () {},
                        index: 2,
                        selectedScreenIndex: selectedScreenIndex,
                        setPageIndex: setPageIndex),
                  ),
                  Container(
                    width: size.width * 0.2,
                    child: _textIconButtonBuilder(
                        'assets/icons/blog.svg', TITLE_BLOGS, () {},
                        index: 3,
                        selectedScreenIndex: selectedScreenIndex,
                        setPageIndex: setPageIndex),
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.2,
                    child: _textIconButtonBuilder(
                        _isShrink
                            ? 'assets/icons/more.svg'
                            : 'assets/icons/close.svg',
                        'Mở rộng', () {
                      setState(() {
                        _isShrink = !_isShrink;
                      });
                    },
                        index: 8,
                        selectedScreenIndex: selectedScreenIndex,
                        setPageIndex: setPageIndex),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              curve: Curves.easeIn,
              height: _isShrink ? 0 : size.height * 0.08,
              duration: Duration(milliseconds: 300),
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.2,
                    child: FittedBox(
                      child: _extendedTextIconButtonBuilder(
                          'assets/icons/save.svg', TITLE_SAVE,
                          index: 4,
                          selectedScreenIndex: selectedScreenIndex,
                          setPageIndex: setPageIndex),
                    ),
                  ),
                  Container(
                    width: size.width * 0.2,
                    child: FittedBox(
                      child: _extendedTextIconButtonBuilder(
                          'assets/icons/member.svg', TITLE_MEMBERS,
                          index: 5,
                          selectedScreenIndex: selectedScreenIndex,
                          setPageIndex: setPageIndex),
                    ),
                  ),
                  Container(
                    width: size.width * 0.2,
                    child: FittedBox(
                      child: _extendedTextIconButtonBuilder(
                          'assets/icons/product.svg', TITLE_PRODUCTS,
                          index: 6,
                          selectedScreenIndex: selectedScreenIndex,
                          setPageIndex: setPageIndex),
                    ),
                  ),
                  Container(
                    width: size.width * 0.2,
                    child: FittedBox(
                      child: _extendedTextIconButtonBuilder(
                          'assets/icons/info.svg', TITLE_INFO,
                          index: 7,
                          selectedScreenIndex: selectedScreenIndex,
                          setPageIndex: setPageIndex),
                    ),
                  ),
                  Container(
                      width: size.width * 0.2,
                      child: FittedBox(child: _spacer())),
                  //this widget is to fill the blank
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
