import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:flutter/material.dart';

class RegisterEnterpriseProvider extends ChangeNotifier {
  bool isLoading = false;
  String? message;
  Future<String> registerEnterprise({required String enterpriseName}) async {
    isLoading = true;
    notifyListeners();
    final dbHelper = DbHelper.instance;
    bool enterpriseExists = await dbHelper.enterpriseExists(enterpriseName);
    if (enterpriseExists) {
      message = AppStrings.alreadyExists;
    } else {
      await dbHelper.createEnterprise({'enterpriseName': enterpriseName});
      message = AppStrings.success;
    }
    isLoading = false;
    notifyListeners();
    return message!;
  }
}
