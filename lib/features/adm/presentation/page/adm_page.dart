import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/features/enterprises/presentation/pages/enterprises_adm_page.dart';
import 'package:fidelity_app/features/navigation/logic/provider/navigation_provider.dart';
import 'package:fidelity_app/features/users/presentation/page/users_page.dart';
import 'package:fidelity_app/features/vinculation/presentation/page/vinculate_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdmPage extends StatefulWidget {
  const AdmPage({super.key});

  @override
  State<AdmPage> createState() => _AdmPageState();
}

class _AdmPageState extends State<AdmPage> {
  final List<Widget> _pages = [
    UsersPage(),
    VinculatePage(),
    EnterprisesAdmPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final navigationProvider = context.watch<NavigationProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.adm),
        //automaticallyImplyLeading: false,
      ),

      body: _pages[navigationProvider.currentAdmPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_3),
            label: AppStrings.users,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: AppStrings.vinculate,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.domain),
            label: AppStrings.enterprises,
          ),
        ],
        currentIndex: navigationProvider.currentAdmPage,
        onTap: navigationProvider.changeAdmPage,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
