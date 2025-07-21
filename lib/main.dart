import 'package:fidelity_app/app.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
//import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Hive.initFlutter();
  //await Hive.openBox('users');
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const App());
}
