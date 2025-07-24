import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int currentHomePage = 0;
  int currentAdmPage = 0;

  void changeHomePage(int selectedHomePage) {
    currentHomePage = selectedHomePage;
    notifyListeners();
  }

  void changeAdmPage(int selectedAdmPage) {
    currentAdmPage = selectedAdmPage;
    notifyListeners();
  }
}
