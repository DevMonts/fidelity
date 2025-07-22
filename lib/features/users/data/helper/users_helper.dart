import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:fidelity_app/features/users/data/model/user_model.dart';

class UsersHelper {
  Future<int> createUser(Map<String, dynamic> user) async {
    final db = await DbHelper.instance.db;
    return await db.insert('users', user);
  }

  Future<List<UserModel>> showUsers() async {
    final db = await DbHelper.instance.db;
    var data = await db.query('users');
    return data.map((user) => UserModel.mapToObject(user)).toList();
  }

  //TODO: Delete

  Future<bool> loginVerification(String userEmail, String userPassword) async {
    final db = await DbHelper.instance.db;
    final query = await db.query(
      'users',
      where: 'userEmail = ? AND userPassword = ?',
      whereArgs: [userEmail, userPassword],
    );
    return query.isNotEmpty;
  }
}
