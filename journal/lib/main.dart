import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:journal/app.dart';
import 'package:journal/db/database_manager.dart';
import 'package:sqflite/sqflite.dart'; // delete later if not deleting db

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
  ]);
  await deleteDatabase('journal.sqlite3.db'); // remove later
  await DatabaseManager.initialize();
  runApp(App(
    preferences: await SharedPreferences.getInstance())
  );
}
