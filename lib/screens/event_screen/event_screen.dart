import 'dart:convert';
import 'package:dsc_app/apis/events_api.dart';
import 'package:dsc_app/models/event/event_model.dart';
import 'package:dsc_app/screens/event_screen/widgets/event_item.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder<List<EventModel>>(
          future: EventsApi().getEvents(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              List<EventModel> _events = snapshot.data!;
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      child: const Text(
                        'Sự kiện',
                        style: TextStyle(
                            fontSize: 36,
                            color: ERROR_COLOR,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _events.length,
                        itemBuilder: (_, index) => EventItem(
                          title:_events[index].title
                        ))
                  ],
                ),
              );
            } else {
              return Center(child: new CircularProgressIndicator());
            }
          }),
    );
  }
}
