import 'package:sqflite/sqflite.dart';

import 'db_constants.dart';

class TodoDatabase {
  static final TodoDatabase instance = TodoDatabase._internal();

  static Database? _database;

  TodoDatabase._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/todos.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute('''
        CREATE TABLE ${TodoTableFields.tableName} (
          ${TodoTableFields.id} ${DbDataTypes.idType},
          ${TodoTableFields.title} ${DbDataTypes.textType},
          ${TodoTableFields.content} ${DbDataTypes.textType},
          ${TodoTableFields.isCompleted} ${DbDataTypes.intType},
          ${TodoTableFields.time} ${DbDataTypes.textType},
          ${TodoTableFields.date} ${DbDataTypes.textType} )
      ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
