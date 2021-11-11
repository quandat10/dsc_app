import 'package:dsc_app/apis/events_api.dart';
import 'package:dsc_app/models/event/event_model.dart';
import 'package:dsc_app/screens/event_screen/widgets/event_item.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

enum SortByState { UpComing, Past, All }

enum SortByTime { Today, ThisMonth, ThisYear, FromDatePicker, All }

class EventScreen extends StatefulWidget {
  EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  var _sortByState = SortByState.All;
  var _sortByTime = SortByTime.All;
  var _chosenDate = DateTime.now();
  var isToday = false;
  var isThisMonth = false;
  var isThisYear = false;
  var isFromDatePicker = false;
  var isComing = false;
  var isPast = false;
  PagingController<int, EventModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  dispose(){
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await EventsApi().getEvents(pageKey: pageKey);
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

  Widget _sortButton(String text, Color textColor, Color backgroundColor,
      SortByState check, StateSetter _setState) {
    return GestureDetector(
      onTap: () {
        switch (text) {
          case 'Sắp diễn ra':
            _setState(() {
              if (_sortByState == SortByState.UpComing)
                _sortByState = SortByState.All;
              else
                _sortByState = SortByState.UpComing;
            });
            break;
          case 'Đã kết thúc':
            _setState(() {
              if (_sortByState == SortByState.Past)
                _sortByState = SortByState.All;
              else
                _sortByState = SortByState.Past;
            });
            break;
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          border: Border.all(color: backgroundColor, width: 1),
          color: _sortByState == check ? backgroundColor : Colors.white,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: _sortByState == check ? Colors.white : textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _sortByTimeButton(String text, Color textColor, Color backgroundColor,
      SortByTime check, StateSetter _setState) {
    return GestureDetector(
      onTap: () {
        switch (text) {
          case 'Hôm nay':
            _setState(() {
              if (_sortByTime == SortByTime.Today)
                _sortByTime = SortByTime.All;
              else
                _sortByTime = SortByTime.Today;
            });
            break;
          case 'Trong tháng':
            _setState(() {
              if (_sortByTime == SortByTime.ThisMonth)
                _sortByTime = SortByTime.All;
              else
                _sortByTime = SortByTime.ThisMonth;
            });
            break;
          case 'Trong năm':
            _setState(() {
              if (_sortByTime == SortByTime.ThisYear)
                _sortByTime = SortByTime.All;
              else
                _sortByTime = SortByTime.ThisYear;
            });
            break;
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: backgroundColor, width: 1),
          color: _sortByTime != check ? Colors.white : backgroundColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: _sortByTime != check ? textColor : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _getDatePicker(SortByTime check, StateSetter _setState) {
    return GestureDetector(
      onTap: () async {
        await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 5000)),
          lastDate: DateTime.now().subtract(Duration(days: -365)),
        ).then((value) {
          if (value != null) {
            setState(() {
              _chosenDate = value;
            });
            _setState(() {
              _sortByTime = SortByTime.FromDatePicker;
            });
          } else {
            _sortByTime = SortByTime.All;
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: PRIMARY_COLOR, width: 1),
          color: _sortByTime != check ? Colors.white : PRIMARY_COLOR,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontAwesomeIcons.calendar,
              color: _sortByTime != check ? SECONDARY_COLOR : Colors.white,
              size: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              _sortByTime != check
                  ? 'Chọn ngày bất kỳ từ lịch'
                  : DateFormat.yMEd().format(_chosenDate),
              style: TextStyle(
                fontSize: 13,
                color: _sortByTime != check ? SECONDARY_COLOR : Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              color: _sortByTime != check ? SECONDARY_COLOR : Colors.white,
              size: 9,
            )
          ],
        ),
      ),
    );
  }

  void _showSortBottomSheet() {
    var bottomSheet = showModalBottomSheet(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (_context, _setState) => Container(
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
                        _sortButton('Sắp diễn ra', SECONDARY_COLOR,
                            PRIMARY_COLOR, SortByState.UpComing, _setState),
                        _sortButton('Đã kết thúc', SECONDARY_COLOR,
                            PRIMARY_COLOR, SortByState.Past, _setState),
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
                        _sortByTimeButton('Hôm nay', SECONDARY_COLOR,
                            PRIMARY_COLOR, SortByTime.Today, _setState),
                        const SizedBox(width: 10),
                        _sortByTimeButton('Trong tháng', SECONDARY_COLOR,
                            PRIMARY_COLOR, SortByTime.ThisMonth, _setState),
                        const SizedBox(width: 10),
                        _sortByTimeButton('Trong năm', SECONDARY_COLOR,
                            PRIMARY_COLOR, SortByTime.ThisYear, _setState),
                        _getDatePicker(SortByTime.FromDatePicker, _setState),
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
                      child: GestureDetector(
                        onTap: () {
                          _setState(() {
                            _sortByTime = SortByTime.All;
                            _sortByState = SortByState.All;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: PRIMARY_COLOR, width: 1),
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
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(ctx).pop();
                          setState(() {});
                        },
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      isDismissible: true,
    );
    bottomSheet.whenComplete(() => setState(() {}));
  }

  bool eventSorting(EventModel element) {
    EventModel event = EventModel(
        id: -1,
        title: '',
        imageUrl: '',
        time: '',
        description: '',
        guests: [],
        eventUrl: EventUrl(info: '', register: ''),
        location: Location(name: '', address: ''),
        status: '');
    //check sort by status
    switch (_sortByState) {
      case SortByState.UpComing:
        if (element.status == 'UPCOMING') event = element;
        break;
      case SortByState.Past:
        if (element.status == 'PAST') event = element;
        break;
      case SortByState.All:
        event = element;
        break;
    }

    EventModel secondSortedEvent = EventModel(
        id: -1,
        title: '',
        imageUrl: '',
        time: '',
        description: '',
        guests: [],
        eventUrl: EventUrl(info: '', register: ''),
        location: Location(name: '', address: ''),
        status: '');

    //check sort by time
    switch (_sortByTime) {
      case SortByTime.Today:
        if (DateTime.parse(element.time).day == DateTime.now().day &&
            DateTime.parse(element.time).month == DateTime.now().month &&
            DateTime.parse(element.time).year == DateTime.now().year)
          secondSortedEvent = event;
        break;
      case SortByTime.ThisMonth:
        if (DateTime.parse(element.time).month == DateTime.now().month &&
            DateTime.parse(element.time).year == DateTime.now().year)
          secondSortedEvent = event;
        break;
      case SortByTime.ThisYear:
        if (DateTime.parse(element.time).year == DateTime.now().year)
          secondSortedEvent = event;
        break;
      case SortByTime.FromDatePicker:
        if (DateTime.parse(element.time).day == _chosenDate.day &&
            DateTime.parse(element.time).month == _chosenDate.month &&
            DateTime.parse(element.time).year == _chosenDate.year)
          secondSortedEvent = event;
        break;
      case SortByTime.All:
        secondSortedEvent = event;
        break;
    }
    if (secondSortedEvent == element)
      return true;
    else
      return false;
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sự kiện',
                    style: TextStyle(
                        fontSize: 36,
                        color: ERROR_COLOR,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.72),
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
                        children: <Widget>[
                          SvgPicture.asset('assets/icons/filter.svg'),
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
            PagedListView<int, EventModel>(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<EventModel>(
                  newPageProgressIndicatorBuilder: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  itemBuilder: (context, item, index) {
                    if (eventSorting(item))
                      return AnimationConfiguration.staggeredList(
                        duration: const Duration(milliseconds: 500),
                        position: index,
                        child: ScaleAnimation(
                          child: FadeInAnimation(child: EventItem(item)),
                        ),
                      );
                    else {
                      return Container();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
