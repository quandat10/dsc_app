import 'package:flutter/material.dart';

class ChoiceChipItem extends StatelessWidget {
  Function setSelectedIndex;
  final int selectedIndex;
  final int index;
  ChoiceChipItem(this.setSelectedIndex, this.selectedIndex, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ChoiceChip(
        pressElevation: 20,
        elevation: 5,
        label: Text('Category'),
        selected: selectedIndex == index,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Color(0xffededed),
        onSelected: (value) {
          setSelectedIndex(index);
        },
        selectedColor: Theme.of(context).accentColor,
      ),
    );
  }
}
