import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:fidelity_app/features/vinculation/data/model/vinculation_model.dart';
import 'package:fidelity_app/features/vinculation/logic/provider/vinculate_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VinculatePage extends StatefulWidget {
  const VinculatePage({super.key});

  @override
  State<VinculatePage> createState() => _VinculatePageState();
}

class _VinculatePageState extends State<VinculatePage> {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController enterpriseIdController = TextEditingController();
  late Future<List<VinculationModel>> vinculation;
  @override
  void initState() {
    super.initState();
    vinculation = DbHelper.instance.showVinculations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: AppStrings.userId),
                  controller: userIdController,
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    final provider = Provider.of<VinculateProvider>(
                      context,
                      listen: false,
                    );
                    final mesage = await provider.vinculate(
                      userId: int.parse(userIdController.text.trim()),
                      enterpriseId: int.parse(
                        enterpriseIdController.text.trim(),
                      ),
                    );
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(mesage)));
                    setState(() {
                      vinculation = DbHelper.instance.showVinculations();
                    });
                  },
                  child: Text(AppStrings.vinculate),
                ),
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: AppStrings.enterpriseId,
                  ),
                  controller: enterpriseIdController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<VinculationModel>>(
              future: vinculation,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final vinculation = snapshot.data![index];
                      return Card(
                        child: Text(
                          '${vinculation.userId} ${vinculation.enterpriseId}',
                        ),
                      );
                    },
                  );
                } //TODO: Empty
                else {
                  return const Text(AppStrings.generalError);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
