import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RegisterProvider extends ChangeNotifier{
  bool isLoading = false;
  String? message;
  Future<String> registerUser({
    required String email,
    required String password,
  }) async {
    final box = await Hive.openBox('users');
    if (box.containsKey(email)) {
      return AppStrings.emailAlreadyExists;
    } else {
      await box.put(email, password);
      return AppStrings.success;
    }
  }
}