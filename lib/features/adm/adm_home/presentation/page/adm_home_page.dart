import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/features/register/presentation/page/register_enterprise_page.dart';
import 'package:fidelity_app/features/home/logic/provider/navigation_provider.dart';
import 'package:fidelity_app/features/register/presentation/page/register_user_page.dart';
import 'package:fidelity_app/features/users/presentation/page/users_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdmHomePage extends StatefulWidget {
  const AdmHomePage({super.key});

  @override
  State<AdmHomePage> createState() => _AdmHomePageState();
}

class _AdmHomePageState extends State<AdmHomePage> {
  final List<Widget> _pages = [
    UsersPage(),
    RegisterUserPage(),
    RegisterEnterprisePage(),
  ];
  @override
  Widget build(BuildContext context) {
    final navigationProvider = context.watch<NavigationProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.adm),
        automaticallyImplyLeading: false,
      ),

      body: _pages[navigationProvider.currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_3),
            label: AppStrings.users,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: AppStrings.registerUser,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.domain_add),
            label: AppStrings.registerEnterprise,
          ),
        ],
        currentIndex: navigationProvider.currentPage,
        onTap: navigationProvider.changePage,
      ),
    );
  }
}
