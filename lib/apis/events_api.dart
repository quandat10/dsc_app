import 'dart:convert';

import 'package:dsc_app/models/event/event_model.dart';
import 'package:http/http.dart' as http;

class EventsApi {
  Future<List<EventModel>> getEvents() async {
    List<EventModel> events = <EventModel>[];
    var request = http.Request(
        'GET', Uri.parse('http://188.166.219.131:8000/api/v1/events'));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = json.decode(await response.stream.bytesToString());
      if (data['status'] == "200") {
        return data["result"]
            .map<EventModel>((json) => EventModel.fromJson(json))
            .toList();
      }
    } else {
      print(response.reasonPhrase);
    }
    return events;
  }
}
