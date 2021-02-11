import 'package:sqflite/sqlite_api.dart';
import 'model.dart';
import 'access_database.dart';

class CRUD {
  static const todoTable = 'client';
  static const id = 'id';
  static const nickname = 'nickname';
  static const email = 'email';
  static const store = 'store';
  static const phone = 'phone';

  AccessDatabase dbHelper = new AccessDatabase(); 
  Future<int>
  insert(Model todo) async {
    Database db = await dbHelper.initDb();
    final sql = '''INSERT INTO ${CRUD.todoTable} (
      ${CRUD.nickname},
      ${CRUD.email},
      ${CRUD.store},
      ${CRUD.phone}
    )
    VALUES (?,?,?,?)''';
    List<dynamic> params = [todo.nickname, todo.email, todo.store, todo.phone];
    final result = await db.rawInsert(sql, params);
    return result;
  }

  Future<int> update (Model todo) async {
    Database db = await dbHelper.initDb();
    final sql = '''
      UPDATE ${CRUD.todoTable} SET 
      ${CRUD.nickname} = ?, 
      ${CRUD.email} = ?, 
      ${CRUD.store} = ?, 
      ${CRUD.phone} = ?
      WHERE ${CRUD.id} = ? 
    ''';
    
    List<dynamic> params = [todo.nickname, todo.email, todo.store, todo.phone, todo.id];
    final result = await db.rawUpdate(sql, params);
    return result;
  }

  Future<int> delete(Model todo) async {
    Database db = await dbHelper.initDb();
    final sql = ''' DELETE FROM ${CRUD.todoTable} WHERE ${CRUD.id} = ? ''';

    List<dynamic> params = [todo.id];
    final result = await db.rawDelete(sql, params);
    return result;
  }

  Future<List<Model>> getClientList() async {
    Database db = await dbHelper.initDb();
    final sql = ''' SELECT * FROM ${CRUD.todoTable} ''';
    final data = await db.rawQuery(sql);

    // ignore: deprecated_member_use
    List<Model> todos = List();
    for (final node in data) {
      final todo = Model.fromMap(node);
      todos.add(todo);
    }
    return todos;
  }
}