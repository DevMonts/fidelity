import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:fidelity_app/features/enterprises/data/model/enterprise_model.dart';
//import 'package:fidelity_app/features/enterprises/data/repository/enterprise_repository.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  List<EnterpriseModel> enterprisesArray = [];
  //EnterpriseRepository.enterprisesArray;
  Future<void> searchEnterprises([String query = '']) async {
    final allEnterprises = await DbHelper.instance.enterprisesHelper.showEnterprises();
    if (query.isEmpty) {
      enterprisesArray =
          //EnterpriseRepository.
          allEnterprises;
    } else {
      enterprisesArray =
          // EnterpriseRepository.
          allEnterprises //Array
              .where(
                ((enterprise) => enterprise.enterpriseName.toLowerCase().contains(
                  query.toLowerCase(),
                )),
              )
              .toList();
    }
    notifyListeners();
  }
}
