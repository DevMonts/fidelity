import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/constants/app_theme.dart';
import 'package:fidelity_app/common/router/app_router.dart';
import 'package:fidelity_app/features/enterprises/logic/providers/search_provider.dart';
import 'package:fidelity_app/features/home/logic/provider/navigation_provider.dart';
import 'package:fidelity_app/features/login/logic/provider/login_provider.dart';
import 'package:fidelity_app/features/login/presentation/page/login_page.dart';
import 'package:fidelity_app/features/register/logic/provider/register_enterprise_provider.dart';
import 'package:fidelity_app/features/register/logic/provider/register_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => RegisterUserProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterEnterpriseProvider()),
      ],

      child: MaterialApp(
        title: AppStrings.app,
        theme: AppTheme.lightTheme,
        home: const LoginPage(),
        onGenerateRoute: AppRouter.OnGenerateRoute,
        initialRoute: '/login',
      ),
    );
  }
}
