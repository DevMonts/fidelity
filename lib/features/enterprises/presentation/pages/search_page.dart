import 'package:fidelity_app/features/enterprises/logic/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            searchProvider.searchEnterprises(value);
          },
          decoration: InputDecoration(hintText: 'Pesquisar...'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: searchProvider.enterprisesArray.length,
        itemBuilder: (context, index) {
          final enterprise = searchProvider.enterprisesArray[index];
          return Card(
            child: Container(
              child: Text(enterprise.enterpriseName),
              height: 100,
            ),
          );
        },
      ),
    );
  }
}
