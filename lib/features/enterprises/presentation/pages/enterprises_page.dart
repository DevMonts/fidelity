import 'package:fidelity_app/common/constants/app_strings.dart';
//import 'package:fidelity_app/features/enterprises/data/repository/enterprise_repository.dart';
import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:fidelity_app/features/enterprises/data/model/enterprise_model.dart';
import 'package:fidelity_app/features/register/logic/provider/register_enterprise_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    enterprises = DbHelper.instance.enterprisesHelper.showEnterprises();
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
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${enterprise.enterpriseId}'),
                      ),
                      title: Text(enterprise.enterpriseName),
                      //subtitle: null,
                      //onTap: () {},
                      //onLongPress: () {},
                    );
                  },
                );
              }
              if (snapshot.hasData && snapshot.data!.isEmpty) {
                return const Center(child: Text(AppStrings.empty));
              } else {
                return const Text(AppStrings.generalError);
              }
            },
          ),
    );
  }
}
