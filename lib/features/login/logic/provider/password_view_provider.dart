import 'package:flutter/material.dart';

class PasswordViewProvider extends ChangeNotifier {
  bool obscureText = true;
  void changePasswordViewer() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
