import 'package:sqflite/sqflite.dart';
import 'db_constants.dart';
import '../../features/todos/data/model/todo.dart';

class TodoDao {
  TodoDao({required this.database});
  final Database database;

  Future<List<Todo>> fetchTodos() async {
    {
      final queryResult = await database.query(TodoTableFields.tableName,
          columns: TodoTableFields.columns);

      final List<Todo> todos = [];
      if (queryResult.isEmpty) {
        return todos;
      }
      for (final row in queryResult) {
        todos.add(Todo.fromMap(row));
      }
      return todos;
    }
  }

  Future<Todo?> insertTodo(Todo todo) async {
    final todoId =
        await database.insert(TodoTableFields.tableName, todo.toMap());
    return todo.copyWith(id: todoId);
  }

  Future<void> updateTodo(Todo todo) async {
    await database.update(
      TodoTableFields.tableName,
      todo.toMap(),
      where: '${TodoTableFields.id} = ?',
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteTodo(int todoId) async {
    await database.delete(
      TodoTableFields.tableName,
      where: '${TodoTableFields.id} = ?',
      whereArgs: [todoId],
    );
  }
}
