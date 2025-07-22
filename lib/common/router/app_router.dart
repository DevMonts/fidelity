import 'package:fidelity_app/features/adm/presentation/page/adm_page.dart';
import 'package:fidelity_app/features/home/presentation/page/home_page.dart';
import 'package:fidelity_app/features/login/presentation/page/adm_login_page.dart';
import 'package:fidelity_app/features/login/presentation/page/login_page.dart';
import 'package:fidelity_app/features/register/presentation/page/register_user_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> OnGenerateRoute(RouteSettings routes) {
    switch (routes.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterUserPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/adm':
        return MaterialPageRoute(builder: (_) => AdmPage());
      case '/admLogin':
        return MaterialPageRoute(builder: (_) => const AdmLoginPage());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}
