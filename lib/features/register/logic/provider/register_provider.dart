//mport 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';

class RegisterProvider extends ChangeNotifier {
  bool isLoading = false;
  String? message;
  Future<String> registerUser({
    required String userEmail,
    required String userPassword,
    required String userEnterpriseId,
  }) async {
    // final box = await Hive.openBox('users');
    isLoading = true;
    notifyListeners();
    final dbHelper = DbHelper.instance;
    bool emailExists = await dbHelper.loginVerification(
      userEmail,
      userPassword,
    );
    if (
    //box.containsKey(
    emailExists
    //)
    ) {
      //   return
      message = AppStrings.emailAlreadyExists;
    } else {
      await
      //box.put(email, password);
      dbHelper.createUser({
        'userEmail': userEmail,
        'userPassword': userPassword,
        'userEnterprise_id': userEnterpriseId,
      });
      //   return
      message = AppStrings.success;
    }
    isLoading = false;
    notifyListeners();
    return message!;
  }
}
