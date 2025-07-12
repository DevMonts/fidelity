import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LoginProvider extends ChangeNotifier {
  bool isLogged = false;
  Future<void> login(String email, String password) async {
    final box  = await Hive.openBox('users');
    final registeredPassword = box.get(email);
    if (registeredPassword == password) {
      isLogged = true;
      notifyListeners();
    } else {
      isLogged = false;
      notifyListeners();
    }
  }
}
