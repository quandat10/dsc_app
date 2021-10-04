import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/urls.dart';

class HomeScreenLogo extends StatelessWidget {
  const HomeScreenLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(HOMEPAGE_BACKGROUND_IMAGE_URL),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white12, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 200),
          padding: EdgeInsets.all(25),
          height: 425,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'We are in together',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                'DSC-HUST',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Hanoi University of Science and Technology'),
            ],
          ),
        ),
      ],
    );
  }
}
