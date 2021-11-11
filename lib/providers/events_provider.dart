import 'dart:convert';

import 'package:dsc_app/models/event/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventsProvider with ChangeNotifier {
  static const EVENT_KEY = 'SAVED_EVENTS';
  List<EventModel> _savedEvents = [];

  List<EventModel> get savedEvents {
    return [..._savedEvents];
  }

  void getEventListFromDevice() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? deviceData = sharedPreferences.getString(EVENT_KEY);
    if (deviceData == null)
      return;
    else {
      List<EventModel> _deviceSavedEvents =
          (json.decode(sharedPreferences.getString(EVENT_KEY) as String)
                  as List<dynamic>)
              .map<EventModel>((e) => EventModel.fromJson(e))
              .toList();
      _savedEvents = _deviceSavedEvents;
    }
  }

  void addEventToSaveList(EventModel event) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (_savedEvents.any((element) => element.id == event.id))
      return;
    else {
      final tmp = EventModel(
          id: event.id,
          title: event.title,
          imageUrl: event.imageUrl,
          time: event.time,
          description: event.description,
          guests: event.guests,
          eventUrl: event.eventUrl,
          location: event.location,
          status: event.status);
      _savedEvents.add(tmp);
    }
    sharedPreferences.setString(
        EVENT_KEY, json.encode(_savedEvents.map((e) => e.toJson()).toList()));
    Fluttertoast.showToast(
        msg: 'Đã lưu sự kiện!',
        timeInSecForIosWeb: 2,
        gravity: ToastGravity.CENTER);
    notifyListeners();
  }

  void removeEventFromList(EventModel event) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (!_savedEvents.any((element) => element.id == event.id))
      return;
    else
      _savedEvents.removeWhere((element) => element.id == event.id);
    sharedPreferences.setString(
        EVENT_KEY, json.encode(_savedEvents.map((e) => e.toJson()).toList()));
    Fluttertoast.showToast(
        msg: 'Đã bỏ lưu sự kiện!',
        timeInSecForIosWeb: 2,
        gravity: ToastGravity.CENTER);
    notifyListeners();
  }
}
