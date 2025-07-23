import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:flutter/material.dart';

class AdmLoginPage extends StatelessWidget {
  const AdmLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              labelText: AppStrings.admCodeLabel,
              border: OutlineInputBorder(),
            ),
            obscureText: true,
            onChanged: (value) {
              if (value == AppStrings.admCode) {
                Navigator.pushNamed(context, '/adm');
              }
            },
          ),
        ),
      ),
    );
  }
}
