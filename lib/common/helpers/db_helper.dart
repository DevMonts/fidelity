import 'package:fidelity_app/features/enterprises/data/model/enterprise_model.dart';
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

  Future<List<EnterpriseModel>> showEnterprises() async {
    final db = await this.db;
    var data = await db.query('enterprises');
    return data
        .map((enterprise) => EnterpriseModel.mapToObject(enterprise))
        .toList();
  }

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
    return await db.insert('users', user);
  }

  Future<int> createEnterprise(Map<String, dynamic> enterprise) async {
    final db = await this.db;
    return await db.insert('enterprises', enterprise);
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

  Future<bool> enterpriseExists(String enterpriseName) async {
    final db = await this.db;
    final query = await db.query(
      'enterprises',
      where: 'enterpriseName = ?',
      whereArgs: [enterpriseName],
    );
    return query.isNotEmpty;
  }

  //TODO: Delete enterprise
}
