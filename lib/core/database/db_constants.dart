class TodoTableFields {
  static const String tableName = 'todos';
  static const columns = <String>[id, title, content, isCompleted, time, date];
  static const String id = 'id';
  static const String title = 'title';
  static const String content = 'content';
  static const String isCompleted = 'is_completed';
  static const String time = 'time';
  static const String date = 'date';
}

class DbDataTypes {
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT';
  static const String intType = 'INTEGER NOT NULL';
}
