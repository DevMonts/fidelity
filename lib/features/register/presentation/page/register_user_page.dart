import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/constants/app_text.dart';
import 'package:fidelity_app/features/login/logic/provider/password_view_provider.dart';
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
                labelText: AppStrings.emailLabel,
                border: OutlineInputBorder(),
              ),
              controller: emailController,
            ),
            Consumer<PasswordViewProvider>(
              builder: (context, passwordViewProvider, child) {
                return TextFormField(
                  decoration: InputDecoration(
                    labelText: AppStrings.passwordLabel,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordViewProvider.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        Provider.of<PasswordViewProvider>(
                          context,
                          listen: false,
                        ).changePasswordViewer();
                      },
                    ),
                  ),
                  obscureText: passwordViewProvider.obscureText,
                  controller: passwordController,
                );
              },
            ),
            Consumer<PasswordViewProvider>(
              builder: (context, passwordViewProvider, child) {
                return TextFormField(
                  decoration: InputDecoration(
                    labelText: AppStrings.confirmPasswordLabel,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordViewProvider.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        Provider.of<PasswordViewProvider>(
                          context,
                          listen: false,
                        ).changePasswordViewer();
                      },
                    ),
                  ),
                  obscureText: passwordViewProvider.obscureText,
                  controller: confirmPasswordController,
                );
              },
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
                Navigator.pushNamed(context, '/home');
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
