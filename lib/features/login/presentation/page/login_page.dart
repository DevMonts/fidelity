import 'package:fidelity_app/common/constants/app_colors.dart';
import 'package:fidelity_app/common/constants/app_text.dart';
import 'package:fidelity_app/common/constants/app_theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;
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
              Text(widget.title, style: AppText.title),
              Text('Seu app de fidelidade com empresas!'),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              IconButton(onPressed: null, icon: Icon(Icons.send)),
              SizedBox(height: 200),
              Text('Não tem uma conta?'),
              TextButton(
                onPressed: null,
                child: Text(
                  'Clique aqui e cadastre-se.',
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
