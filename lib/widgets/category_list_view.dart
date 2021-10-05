import 'package:dsc_app/widgets/choice_chip.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatefulWidget {

  CategoryListView({Key? key}) : super(key: key);

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  var _selectedIndex = 0;

  void setSelectedIndex(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (ctx, i) => ChoiceChipItem(setSelectedIndex, _selectedIndex, i)
      ),
    );
  }
}
