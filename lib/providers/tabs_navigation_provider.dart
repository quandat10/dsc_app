import 'package:flutter/cupertino.dart';

class TabsNavigationProvider with ChangeNotifier {
  var selectedScreenIndex = 0;
  PageController pageController = PageController();

  void setSelectedScreenIndex(int index){
    selectedScreenIndex = index;
    notifyListeners();
  }

  void setPageIndex(int index) {
    if (selectedScreenIndex == index - 1) {
      pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    } else if (selectedScreenIndex == index + 1) {
      pageController.previousPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      pageController.jumpToPage(index);
    }
    notifyListeners();
    Future.delayed(Duration(milliseconds: 500))
        .then((value) => selectedScreenIndex = index);
    notifyListeners();
  }
}
