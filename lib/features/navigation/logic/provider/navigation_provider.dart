import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int currentHomePage = 0;
  int currentAdmPage = 0;
  final PageController homePageController = PageController();
  final PageController admPageController = PageController();

  void changeHomePage(int selectedHomePage) {
    currentHomePage = selectedHomePage;
    homePageController.animateToPage(
      selectedHomePage,
      duration: Duration(seconds: 10),
      curve: Curves.bounceInOut,
    );
    notifyListeners();
  }

  void changeAdmPage(int selectedAdmPage) {
    currentAdmPage = selectedAdmPage;
    admPageController.animateToPage(
      selectedAdmPage,
      duration: Duration(seconds: 10),
      curve: Curves.bounceInOut,
    );
    notifyListeners();
  }

  void updateHomePageFromScroll(int index) {
    currentHomePage = index;
    notifyListeners();
  }

  void updateAdmPageFromScroll(int index) {
    currentAdmPage = index;
    notifyListeners();
  }
}
