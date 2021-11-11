import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';

class DocScreen extends StatelessWidget {
  const DocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: const Text(
              'Tài liệu',
              style: TextStyle(
                  fontSize: 28,
                  color: ERROR_COLOR,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.72),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Coming soon',
                  style: TextStyle(
                      fontSize: 40,
                      color: Color.fromRGBO(255, 175, 189, 1),
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.72,
                      shadows: [
                        Shadow(
                            color: Color.fromRGBO(255, 175, 189, 1),
                            blurRadius: 60)
                      ]),
                ),
                Text(
                  'Coming soon',
                  style: TextStyle(
                      fontSize: 40,
                      color: Color.fromRGBO(252, 80, 152, 1),
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.72,
                      shadows: [
                        Shadow(
                            color: Color.fromRGBO(252, 80, 152, 1),
                            blurRadius: 60)
                      ]),
                ),
                Text(
                  'Coming soon',
                  style: TextStyle(
                      fontSize: 40,
                      color: Color.fromRGBO(248, 0, 121, 1),
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.72,
                      shadows: [
                        Shadow(
                            color: Color.fromRGBO(248, 0, 121, 1),
                            blurRadius: 60)
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
