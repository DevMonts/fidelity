import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';

class LoginProvider extends ChangeNotifier {
  bool isLogged = false;
  String? errorLoginMessage;
  Future<void> login(String userEmail, String userPassword) async {
    //final box  = await Hive.openBox('users');
    final dbHelper = DbHelper.instance;
    //final registeredPassword = box.get(email);
    bool userExists = await dbHelper.usersHelper.loginVerification(userEmail, userPassword);
    if (
    //registeredPassword == password
    userExists) {
      isLogged = true;
      notifyListeners();
    } else {
      isLogged = false;
      errorLoginMessage = AppStrings.loginError;
    }
    notifyListeners();
  }
}
