import 'package:fidelity_app/common/constants/app_strings.dart';
import 'package:fidelity_app/features/users/data/model/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._instantiate();
  static Database? _database;
  DbHelper._instantiate();
  Future<Database> get db async {
    if (_database != null) return _database!;
    _database = await initDb('users_and_enterprises.db');
    return _database!;
  }

  Future<Database> initDb(String dbName) async {
    String completePath = join(await getDatabasesPath(), dbName);
    return await openDatabase(completePath, version: 1, onCreate: createDb);
  }

  Future<List<UserModel>> showUsers() async {
    final db = await this.db;
    var data = await db.query('users');
    return data.map((user) => UserModel.mapToObject(user)).toList();
  }

  //TODO: enterprise_id
  // ,
  //         userEnterprise_id INTEGER,
  //         FOREIGN KEY (userEnterprise_id) REFERENCES enterprises(enterprisesId)
  Future createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        userId INTEGER PRIMARY KEY AUTOINCREMENT,
        userEmail TEXT NOT NULL UNIQUE,
        userPassword TEXT NOT NULL,
        userEnterprise_id INTEGER,
        FOREIGN KEY (userEnterprise_id) REFERENCES enterprises(enterprisesId)
      )
    ''');
    await db.execute('''
      CREATE TABLE enterprises (
        enterprisesId INTEGER PRIMARY KEY AUTOINCREMENT,
        enterpriseName TEXT NOT NULL
      )
    ''');
  }

  Future<Map<String, dynamic>> readUsers(int userId) async {
    final db = await this.db;
    final query = await db.query(
      'users',
      where: 'userid = ?',
      whereArgs: [userId],
    );
    if (query.isNotEmpty) {
      return query.first;
    } else {
      throw Exception(AppStrings.loginError);
    }
  }

  // Future<Map<String, dynamic>> readEnterprises(int enterpriseId) async {
  //   final db = await this.db;
  //   final query = await db.query(
  //     'enterprises',
  //     where: 'enterprisesId = ?',
  //     whereArgs: [enterpriseId],
  //   );
  //   if (query.isNotEmpty) {
  //     return query.first;
  //   } else {
  //     throw Exception(AppStrings.generalError);
  //   }
  // }

  Future<int> createUser(Map<String, dynamic> user) async {
    final db = await this.db;
    // if (user['userEnterpriseId'] == null) {
    //   user['userEnterpriseId'] = 0;
    // }
    return await db.insert('users', user);
  }

  Future<bool>
  //email
  //password
  loginVerification(String userEmail, String userPassword) async {
    final db = await this.db;
    final query = await db.query(
      'users',
      where: 'userEmail = ? AND userPassword = ?',
      whereArgs: [userEmail, userPassword],
    );
    return query.isNotEmpty;
  }

  //TODO: Delete enterprise
}
