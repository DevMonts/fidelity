import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:flutter/material.dart';

class VinculateProvider extends ChangeNotifier {
  bool isLoading = false;
  String? message;
  Future<String> vinculate({
    required int userId,
    required int enterpriseId,
  }) async {
    isLoading = true;
    notifyListeners();
    final dbHelper = DbHelper.instance;
    bool vinculationExists = await dbHelper.vinculationHelper.vinculationExists(
      userId,
      enterpriseId,
    );
    if (vinculationExists) {
      message = AppStrings.alreadyExists;
    } else {
      await dbHelper.vinculationHelper.createVinculation({
        'userId': userId,
        'enterpriseId': enterpriseId,
      });
      message = AppStrings.success;
    }
    isLoading = false;
    notifyListeners();
    return message!;
  }
}
