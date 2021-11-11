import 'package:dsc_app/utils/colors.dart';
import 'package:flutter/material.dart';

class MemberDepartmentChips extends StatelessWidget {
  String department;
  bool isDetail;

  MemberDepartmentChips(
      {Key? key, required this.department, required this.isDetail})
      : super(key: key);

  Color _setChipColor(String text) {
    switch (text) {
      case 'GDSC Lead':
        return Color(0xffF4881F);
      case 'Former Lead':
        return Color(0xffF4881F);
      case 'Head of HR':
        return Color(0xffF4881F);
      case 'Head of Innovation':
        return Color(0xffF4881F);
      case 'Head of Operation':
        return Color(0xffF4881F);
      case 'Head of Development':
        return Color(0xffF4881F);
      case 'Development':
        return MAIN_COLOR;
      case 'Operation':
        return SECONDARY_COLOR;
      case 'HR':
        return SECONDARY_DECENT;
      case 'Innovation':
        return ERROR_COLOR;
      default:
        return Colors.lightBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isDetail) {
      return FittedBox(
        child: Wrap(
          children: [
            ...department
                .split(',')
                .sublist(0, department.split(',').length >= 2 ? 2 : 1)
                .map(
                  (e) => Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: _setChipColor(e.trim()),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      e.trim(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
          ],
        ),
      );
    } else {
      return Wrap(
        children: [
          ...department.split(',').map(
                (e) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: _setChipColor(e.trim()),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    e.trim(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
        ],
      );
    }
  }
}
