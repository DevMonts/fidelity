import 'package:fidelity_app/common/constants/app_strings.dart';
//import 'package:fidelity_app/features/enterprises/data/repository/enterprise_repository.dart';
import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:fidelity_app/features/enterprises/data/model/enterprise_model.dart';
import 'package:fidelity_app/features/register/logic/provider/register_enterprise_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnterprisesAdmPage extends StatefulWidget {
  const EnterprisesAdmPage({super.key});
  @override
  State<EnterprisesAdmPage> createState() => _EnterprisesAdmPageState();
}

class _EnterprisesAdmPageState extends State<EnterprisesAdmPage> {
  late Future<List<EnterpriseModel>> enterprises;
  @override
  void initState() {
    super.initState();
    enterprises = DbHelper.instance.enterprisesHelper.showEnterprises();
  }

  @override
  Widget build(BuildContext context) {
    //final enterpriseList = EnterpriseRepository.enterprisesArray;
    final nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(
            labelText: AppStrings.registerEnterprise,
            border: OutlineInputBorder(),
          ),
          controller: nameController,
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              final provider = Provider.of<RegisterEnterpriseProvider>(
                context,
                listen: false,
              );
              final mesage = await provider.registerEnterprise(
                enterpriseName: nameController.text.trim(),
              );
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(mesage)));
              setState(() {
                enterprises = DbHelper.instance.enterprisesHelper
                    .showEnterprises();
              });
            },
            icon: const Icon(Icons.add),
          ),
          SizedBox(width: 15),
        ],
        toolbarHeight: 100,
      ),
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
