import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/features/enterprises/data/repository/enterprise_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final enterpriseList = EnterpriseRepository.enterprisesArray;
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.appName)),
      body: ListView.builder(
        itemCount: enterpriseList.length,
        itemBuilder: (context, enterprise) {
          return Card(
            child: Container(
              child: Text(enterpriseList[enterprise].enterpriseName),
              height: 100,
            ),
          );
        },
      ),
    );
  }
}
