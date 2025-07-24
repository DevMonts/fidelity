import 'package:fidelity_app/common/constants/app_strings.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback //Run after build
    ((_) {
      Provider.of<SearchProvider>(context, listen: false).searchEnterprises();
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            searchProvider.searchEnterprises(value);
          },
          decoration: InputDecoration(
            hintText: AppStrings.search,
            border: OutlineInputBorder(),
          ),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
      ),
      body: ListView.builder(
        itemCount: searchProvider.enterprisesArray.length,
        itemBuilder: (context, index) {
          final enterprise = searchProvider.enterprisesArray[index];
          return ListTile(
            leading: CircleAvatar(child: Text('${enterprise.enterpriseId}')),
            title: Text('${enterprise.enterpriseName}'),
          );
        },
      ),
    );
  }
}
