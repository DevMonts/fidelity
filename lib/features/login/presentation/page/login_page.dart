import 'package:fidelity_app/common/constants/app_colors.dart';
import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/constants/app_text.dart';
import 'package:fidelity_app/features/login/logic/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                controller: emailController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppStrings.password,
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                controller: passwordController,
              ),
              Consumer<LoginProvider>(
                builder: (context, loginProvider, child) {
                  return IconButton(
                    onPressed: () async {
                      await loginProvider.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      if (loginProvider.isLogged) {
                        Navigator.pushNamed(context, '/home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(AppStrings.loginError)),
                        );
                      }
                    },
                    icon: Icon(Icons.send),
                  );
                },
              ),
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
