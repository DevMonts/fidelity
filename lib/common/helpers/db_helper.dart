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
    // await deleteDatabase(
    //   join(await getDatabasesPath(), 'users_and_enterprises.db'),
    // );
    _database = await initDb('users_and_enterprises.db');
    return _database!;
  }

  Future<Database> initDb(String dbName) async {
    String completePath = join(await getDatabasesPath(), dbName);
    return await openDatabase(completePath, version: 1, onCreate: createDb);
  }

  Future createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        userId INTEGER PRIMARY KEY AUTOINCREMENT,
        userEmail TEXT NOT NULL UNIQUE,
        userPassword TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE vinculations (
        vinculationId INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        enterpriseId INTEGER NOT NULL,
        FOREIGN KEY (userId) REFERENCES users(userId),
        FOREIGN KEY (enterpriseId) REFERENCES enterprises(enterpriseId)
      )
    ''');
    await db.execute('''
      CREATE TABLE enterprises (
        enterpriseId INTEGER PRIMARY KEY AUTOINCREMENT,
        enterpriseName TEXT NOT NULL
      )
    ''');
  }

  //TODO: Separete by table

  //USERS
  //Create
  Future<int> createUser(Map<String, dynamic> user) async {
    final db = await this.db;
    return await db.insert('users', user);
  }

  //Read
  Future<List<UserModel>> showUsers() async {
    final db = await this.db;
    var data = await db.query('users');
    return data.map((user) => UserModel.mapToObject(user)).toList();
  }

  //TODO: Delete

  //Verification
  Future<bool> loginVerification(String userEmail, String userPassword) async {
    final db = await this.db;
    final query = await db.query(
      'users',
      where: 'userEmail = ? AND userPassword = ?',
      whereArgs: [userEmail, userPassword],
    );
    return query.isNotEmpty;
  }

  //ENTERPRISES
  //Create
  Future<int> createEnterprise(Map<String, dynamic> enterprise) async {
    final db = await this.db;
    return await db.insert('enterprises', enterprise);
  }

  //Read
  Future<List<EnterpriseModel>> showEnterprises() async {
    final db = await this.db;
    var data = await db.query('enterprises');
    return data
        .map((enterprise) => EnterpriseModel.mapToObject(enterprise))
        .toList();
  }

  //TODO: Delete enterprise

  //Veficiation
  Future<bool> enterpriseExists(String enterpriseName) async {
    final db = await this.db;
    final query = await db.query(
      'enterprises',
      where: 'enterpriseName = ?',
      whereArgs: [enterpriseName],
    );
    return query.isNotEmpty;
  }

  //VINCULATION
  //Create
  Future<int> createVinculation(Map<String, dynamic> vinculation) async {
    final db = await this.db;
    return await db.insert('vinculations', vinculation);
  }
  //TODO: Show vinculations

  //TODO: Delete

  //Verification
  Future<bool> vinculationExists(int userId, int enterpriseId) async {
    final db = await this.db;
    final query = await db.query(
      'vinculations',
      where: 'userId = ? AND enterpriseId = ?',
      whereArgs: [userId, enterpriseId],
    );
    return query.isNotEmpty;
  }
}
