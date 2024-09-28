import '../../../../core/database/todo_dao.dart';

import '../model/todo.dart';

class TodosLocalDatasource {
  TodosLocalDatasource(this.todoDao);

  final TodoDao todoDao;

  Future<List<Todo>> fetchTodos() async {
    final todos = await todoDao.fetchTodos();
    return todos;
  }

  Future<Todo?> addTodo(Todo todo) async {
    final addedTodo = await todoDao.insertTodo(todo);
    return addedTodo;
  }

  Future<void> updateTodo(Todo todo) async {
    await todoDao.updateTodo(todo);
  }

  Future<void> deleteTodo(int todoId) async {
    await todoDao.deleteTodo(todoId);
  }
}
