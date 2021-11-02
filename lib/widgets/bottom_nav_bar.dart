import 'package:dsc_app/icons/my_flutter_app_icons.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '';

enum OnClickStatus { Click, UnClick }

class BottomNavBar extends StatefulWidget {
  Function setPageIndex;
  int selectedScreenIndex;

  BottomNavBar(this.setPageIndex, this.selectedScreenIndex, {Key? key})
      : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  var _isShrink = true;

  Widget _textIconButtonBuilder(
      IconData icon, String title, void Function() function,
      {required int index}) {
    var iconColor = Colors.white;
    var textColor =
        widget.selectedScreenIndex == index ? Colors.white : Colors.transparent;
    return InkWell(
      onTap: () {
        setState(() {
          //widget.selectedScreenIndex = index;
          if (index != 8) {
            widget.setPageIndex(index);
            _isShrink = true;
          }
        });
        function();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: index == 8 ? Colors.white : iconColor,
          ),
          if (widget.selectedScreenIndex == index)
            SizedBox(
              height: 4,
            ),
          if (widget.selectedScreenIndex == index)
            FittedBox(
              child: Text(
                title,
                style: GoogleFonts.inter(
                    color: index == 8 ? Colors.transparent : textColor),
              ),
            ),
        ],
      ),
    );
  }

  Widget _extendedTextIconButtonBuilder(
      IconData icon, String title, void Function() function,
      {required int index}) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              //widget.selectedScreenIndex = index;
              if (index != 8) {
                widget.setPageIndex(index);
                _isShrink = true;
              }
            });
            function();
          },
          icon: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.inter(color: Colors.white),
        ),
        SizedBox(height: 10,),
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
                        MyFlutterApp.home, 'Home', () {},
                        index: 0),
                  ),
                  Container(
                    width: size.width * 0.2,
                    child: _textIconButtonBuilder(
                        FontAwesomeIcons.search, 'Tìm kiếm', () {},
                        index: 1),
                  ),
                  Container(
                    width: size.width * 0.2,
                    child: _textIconButtonBuilder(
                        FontAwesomeIcons.calendar, 'Sự kiện', () {},
                        index: 2),
                  ),
                  Container(
                    width: size.width * 0.2,
                    child: _textIconButtonBuilder(
                        MyFlutterApp.blog, 'Blog', () {},
                        index: 3),
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.2,
                    child: _textIconButtonBuilder(
                        _isShrink
                            ? Icons.format_list_bulleted
                            : FontAwesomeIcons.windowClose,
                        'Mở rộng', () {
                      setState(() {
                        _isShrink = !_isShrink;
                      });
                    }, index: 8),
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
                          MyFlutterApp.mark, 'Đã lưu', () {},
                          index: 4),
                    ),
                  ),
                  Container(
                    width: size.width * 0.2,
                    child: FittedBox(
                      child: _extendedTextIconButtonBuilder(
                          MyFlutterApp.member, 'Thành viên', () {},
                          index: 5),
                    ),
                  ),
                  Container(
                    width: size.width * 0.2,
                    child: FittedBox(
                      child: _extendedTextIconButtonBuilder(
                          FontAwesomeIcons.trophy, 'Sản phẩm', () {},
                          index: 6),
                    ),
                  ),
                  Container(
                    width: size.width * 0.2,
                    child: FittedBox(
                      child: _extendedTextIconButtonBuilder(
                          MyFlutterApp.info, 'Thông tin', () {},
                          index: 7),
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
