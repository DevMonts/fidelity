import 'package:fidelity_app/app.dart';
import 'package:fidelity_app/common/constants/app_colors.dart';
import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/constants/app_text.dart';
import 'package:fidelity_app/common/constants/app_theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(AppStrings.appName, style: AppText.title),
              Text(AppStrings.subtitle),
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
              SizedBox(height: 200),
              Text(AppStrings.register1),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  AppStrings.register2,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ],
            spacing: 10,
          ),
        ),
      ),
    );
  }
}
