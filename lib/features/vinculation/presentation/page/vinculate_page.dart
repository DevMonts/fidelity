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
    vinculation = DbHelper.instance.vinculationHelper.showVinculations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: AppStrings.userIdLabel,
                      border: OutlineInputBorder(),
                    ),
                    controller: userIdController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
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
                        vinculation = DbHelper.instance.vinculationHelper
                            .showVinculations();
                      });
                    },
                    child: Icon(Icons.swap_horiz),
                    style: ElevatedButton.styleFrom(shape: CircleBorder()),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: AppStrings.enterpriseIdLabel,
                      border: OutlineInputBorder(),
                    ),
                    controller: enterpriseIdController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<VinculationModel>>(
                future: vinculation,
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return Center(child: CircularProgressIndicator());
                  // }
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return Table(
                      border: TableBorder.all(),
                      children: snapshot.data!.map((vinculation) {
                        return TableRow(
                          children: [
                            Center(child: Text('${vinculation.userId}')),
                            Center(child: Text('${vinculation.enterpriseId}')),
                          ],
                        );
                      }).toList(),
                    );
                  }
                  if (snapshot.hasData && snapshot.data!.isEmpty) {
                    return Center(child: Text(AppStrings.empty));
                  } else {
                    return const Text(AppStrings.generalError);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
