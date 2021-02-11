import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AccessDatabase{
  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
      String path = directory.path + 'client.db';
      var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
      return todoDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE client (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nickname TEXT,
        email TEXT,
        store TEXT,
        phone TEXT        
      )
    ''');
  }
}