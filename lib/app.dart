import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/constants/app_theme.dart';
import 'package:fidelity_app/common/router/app_router.dart';
import 'package:fidelity_app/features/login/presentation/page/login_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
      onGenerateRoute: AppRouter.OnGenerateRoute,
      initialRoute: '/login',
    );
  }
}
