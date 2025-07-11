import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;
  void changePage(int selectedPage) {
    _currentPage = selectedPage;
    notifyListeners();
  }
}
