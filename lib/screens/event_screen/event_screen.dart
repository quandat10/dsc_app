import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  EventScreen({Key? key}) : super(key: key);

  var check1 = true;
  var check2 = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          height: mediaQuery.size.height -
              mediaQuery.padding.top -
              mediaQuery.padding.bottom,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  'Sự kiện',
                  style: TextStyle(
                      fontSize: 36,
                      color: ERROR_COLOR,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
