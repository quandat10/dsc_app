import 'package:flutter/material.dart';

class CatogoryListView extends StatelessWidget {
  const CatogoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (ctx, i) => Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.all(5),
          width: 80,
          child: FittedBox(
              child: Text(
                'Category',
                textAlign: TextAlign.center,
              )),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange.shade200, Colors.yellow],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2, 2),
                  blurRadius: 3),
            ],
          ),
        ),
      ),
    );
  }
}
