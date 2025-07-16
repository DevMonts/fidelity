//import 'package:fidelity_app/common/constants/app_strings.dart';
//import 'package:fidelity_app/features/enterprises/data/repository/enterprise_repository.dart';
import 'package:flutter/material.dart';

class EnterprisesPage extends StatefulWidget {
  const EnterprisesPage({super.key});

  @override
  State<EnterprisesPage> createState() => _EnterprisesPageState();
}

class _EnterprisesPageState extends State<EnterprisesPage> {
  @override
  Widget build(BuildContext context) {
    //final enterpriseList = EnterpriseRepository.enterprisesArray;
    return Scaffold(
      body: ListView.builder(
        //itemCount: enterpriseList.length,
        itemBuilder: (context, enterprise) {
          return Card(
            child: Container(
              //child: Text(enterpriseList[enterprise].enterpriseName),
              height: 100,
            ),
          );
        },
      ),
    );
  }
}
