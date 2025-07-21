import 'package:fidelity_app/common/constants/app_strings.dart';
//import 'package:fidelity_app/features/enterprises/data/repository/enterprise_repository.dart';
import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:fidelity_app/features/enterprises/data/model/enterprise_model.dart';
import 'package:flutter/material.dart';

class EnterprisesPage extends StatefulWidget {
  const EnterprisesPage({super.key});
  @override
  State<EnterprisesPage> createState() => _EnterprisesPageState();
}

class _EnterprisesPageState extends State<EnterprisesPage> {
  late Future<List<EnterpriseModel>> enterprises;
  @override
  void initState() {
    super.initState();
    enterprises = DbHelper.instance.showEnterprises();
  }

  @override
  Widget build(BuildContext context) {
    //final enterpriseList = EnterpriseRepository.enterprisesArray;
    return Scaffold(
      body:
          FutureBuilder<List<EnterpriseModel>>
          //View.builder
          (
            future: enterprises,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  itemCount: //enterpriseList
                      snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final enterprise = snapshot.data![index];
                    return Card(
                      child: Container(
                        child: Text(
                          //enterpriseList[enterprise].enterpriseName
                          '${enterprise.enterpriseId} ${enterprise.enterpriseName}',
                        ),
                        height: 100,
                      ),
                    );
                  },
                );
              }  //TODO: Empty
              else {
                return const Text(AppStrings.generalError);
              }
            },
          ),
    );
  }
}
