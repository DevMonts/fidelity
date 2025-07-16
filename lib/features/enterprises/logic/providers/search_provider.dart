//import 'package:fidelity_app/features/enterprises/data/model/enterprise_model.dart';
//import 'package:fidelity_app/features/enterprises/data/repository/enterprise_repository.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  //List<EnterpriseModel> enterprisesArray = EnterpriseRepository.enterprisesArray;
  void searchEnterprises(String query) {
    if (query.isEmpty) {
      //enterprisesArray = EnterpriseRepository.enterprisesArray;
    } else {
      // enterprisesArray = EnterpriseRepository.enterprisesArray
      //     .where(
      //       (enterprise) => enterprise.enterpriseName.toLowerCase().contains(
      //         query.toLowerCase(),
      //       ),
      //     )
      //     .toList();
    }
    notifyListeners();
  }
}
