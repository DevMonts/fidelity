import 'package:fidelity_app/common/constants/app_colors.dart';
import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/constants/app_text.dart';
import 'package:fidelity_app/common/constants/app_theme.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.registerTitle, style: AppText.title),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: AppStrings.email,
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: AppStrings.password,
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            IconButton(onPressed: null, icon: Icon(Icons.send)),
          ],
          spacing: 10,
        ),
      ),
    );
  }
}
