import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:fidelity_app/features/register/presentation/page/register_user_page.dart';
import 'package:fidelity_app/features/users/data/model/user_model.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late Future<List<UserModel>> users;
  @override
  void initState() {
    super.initState();
    users = DbHelper.instance.usersHelper.showUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: RegisterUserPage()),
          Expanded(
            child: FutureBuilder<List<UserModel>>(
              future: users,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final user = snapshot.data![index];
                      return ListTile(
                        leading: CircleAvatar(child: Text('${user.userId}')),
                        title: Text(
                          AppStrings.emailLabel + ': ${user.userEmail}',
                        ),
                        subtitle: Text(
                          AppStrings.passwordLabel + ': ${user.userPassword}',
                        ),
                        //onTap: () {},
                        //onLongPress: () {},
                      );
                    },
                  );
                }
                if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return const Center(child: Text(AppStrings.empty));
                } else {
                  return const Center(child: Text(AppStrings.generalError));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
