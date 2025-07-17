import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/features/enterprises/presentation/pages/enterprises_page.dart';
import 'package:fidelity_app/features/enterprises/presentation/pages/search_page.dart';
import 'package:fidelity_app/features/home/logic/provider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [EnterprisesPage(), SearchPage()];
  @override
  Widget build(BuildContext context) {
    final navigationProvider = context.watch<NavigationProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.app),
        automaticallyImplyLeading: false,
      ),

      body: _pages[navigationProvider.currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: 'Fidelidades',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Procurar'),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: navigationProvider.currentPage,
        onTap: navigationProvider.changePage,
      ),
    );
  }
}
