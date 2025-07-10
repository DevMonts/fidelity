import 'package:fidelity_app/common/constants/app_colors.dart';
import 'package:fidelity_app/common/constants/app_theme.dart';
import 'package:fidelity_app/features/login/presentation/page/login_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const LoginPage(title: 'Fidelity App'),
    );
  }
}
