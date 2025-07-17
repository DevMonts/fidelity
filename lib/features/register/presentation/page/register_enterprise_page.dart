import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/features/register/logic/provider/register_enterprise_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterEnterprisePage extends StatefulWidget {
  const RegisterEnterprisePage({super.key});
  @override
  State<RegisterEnterprisePage> createState() => _RegisterEnterprisePageState();
}

class _RegisterEnterprisePageState extends State<RegisterEnterprisePage> {
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: AppStrings.name),
            controller: nameController,
          ),
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
            },
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
