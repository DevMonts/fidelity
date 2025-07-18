import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/constants/app_text.dart';
import 'package:fidelity_app/features/register/logic/provider/register_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});
  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.register, style: AppText.title),
            SizedBox(height: 20),
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
            TextFormField(
              decoration: InputDecoration(
                labelText: AppStrings.confirmPassword,
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              controller: confirmPasswordController,
            ),
            IconButton(
              onPressed: () async {
                if (passwordController.text.trim() !=
                    confirmPasswordController.text.trim()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppStrings.differentPasswords)),
                  );
                  return;
                }
                final provider = Provider.of<RegisterUserProvider>(
                  context,
                  listen: false,
                );
                final mesage = await provider.registerUser(
                  userEmail: emailController.text.trim(),
                  userPassword: passwordController.text.trim(),
                );
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(mesage)));
              },
              icon: Icon(Icons.send),
            ),
          ],
          spacing: 10,
        ),
      ),
    );
  }
}
