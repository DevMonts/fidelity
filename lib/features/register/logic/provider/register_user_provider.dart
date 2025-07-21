import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:flutter/material.dart';

class RegisterUserProvider extends ChangeNotifier {
  bool isLoading = false;
  String? message;
  Future<String> registerUser({
    required String userEmail,
    required String userPassword,
  }) async {
    isLoading = true;
    notifyListeners();
    final dbHelper = DbHelper.instance;
    bool emailExists = await dbHelper.loginVerification(
      userEmail,
      userPassword,
    );
    if (emailExists) {
      message = AppStrings.alreadyExists;
    } else {
      await dbHelper.createUser({
        'userEmail': userEmail,
        'userPassword': userPassword,
      });
      message = AppStrings.success;
    }
    isLoading = false;
    notifyListeners();
    return message!;
  }
}
