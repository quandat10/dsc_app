import 'dart:convert';
import 'package:dsc_app/apis/events_api.dart';
import 'package:dsc_app/models/event/event_model.dart';
import 'package:dsc_app/screens/event_screen/widgets/event_item.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventScreen extends StatefulWidget {
  EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  Widget _sortButton(String text, Color textColor, Color backgroundColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: PRIMARY_COLOR, width: 1),
        color: Colors.white,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _sortByTimeButton(
      String text, Color textColor, Color backgroundColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: PRIMARY_COLOR, width: 1),
        color: Colors.white,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _getDatePicker() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: PRIMARY_COLOR, width: 1),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            FontAwesomeIcons.calendar,
            color: PRIMARY_COLOR,
            size: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Chọn ngày bất kỳ từ lịch',
            style: TextStyle(
              fontSize: 13,
              color: SECONDARY_COLOR,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward_ios_sharp,
            color: PRIMARY_COLOR,
            size: 9,
          )
        ],
      ),
    );
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        context: context,
        builder: (ctx) => Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: 26,
                    height: 4,
                    decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: const Text(
                      'Lọc',
                      style: TextStyle(
                          fontSize: 36,
                          color: ERROR_COLOR,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _sortButton(
                                'Đã đăng ký', ERROR_COLOR, PRIMARY_COLOR),
                            _sortButton(
                                'Chưa đăng ký', ERROR_COLOR, PRIMARY_COLOR),
                          ],
                        ),
                        Text(
                          'Thời gian',
                          style: TextStyle(
                            fontSize: 18,
                            color: SECONDARY_COLOR,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Wrap(
                          children: [
                            _sortByTimeButton(
                                'Hôm nay', SECONDARY_COLOR, PRIMARY_COLOR),
                            const SizedBox(width: 10),
                            _sortByTimeButton(
                                'Ngày mai', SECONDARY_COLOR, PRIMARY_COLOR),
                            const SizedBox(width: 10),
                            _sortByTimeButton(
                                'Tuần này', SECONDARY_COLOR, PRIMARY_COLOR),
                            _getDatePicker(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: PRIMARY_COLOR, width: 1),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              'Thiết lập lại',
                              style: TextStyle(
                                  color: SECONDARY_COLOR,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                gradient: GRADIENT_01),
                            child: Text(
                              'Áp dụng',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sự kiện',
                    style: TextStyle(
                        fontSize: 36,
                        color: ERROR_COLOR,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1),
                  ),
                  InkWell(
                    onTap: _showSortBottomSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 6),
                      decoration: BoxDecoration(
                          border: Border.all(color: PRIMARY_COLOR, width: 1),
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.face,
                            color: PRIMARY_COLOR,
                            size: 15,
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            "Lọc",
                            style:
                                TextStyle(color: PRIMARY_COLOR, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            AnimationLimiter(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) =>
                      AnimationConfiguration.staggeredList(
                          duration: const Duration(milliseconds: 500),
                          position: index,
                          child: ScaleAnimation(
                              child: FadeInAnimation(child: EventItem())))),
            )
          ],
        ),
      ),
    );
  }
}
