import '../datasource/local_datasource.dart';
import '../model/todo.dart';

import '../../../../core/helper/result.dart';

class TodosRepo {
  final TodosLocalDatasource _datasource;

  TodosRepo({required TodosLocalDatasource datasource})
      : _datasource = datasource;

  Future<Result<List<Todo>>> fetchTodos() async {
    try {
      final result = await _datasource.fetchTodos();
      return Result.success(result);
    } catch (error) {
      return const Result.failure('Error Fetching Todos');
    }
  }

  Future<Result<Todo>> addTodo(Todo todo) async {
    try {
      final result = await _datasource.addTodo(todo);
      return Result.success(result!);
    } catch (error) {
      return const Result.failure('Error adding Todo');
    }
  }

  Future<Result<void>> updateTodo(Todo todo) async {
    try {
      final result = await _datasource.updateTodo(todo);
      return Result.success(result);
    } catch (error) {
      return const Result.failure('Error updating Todo');
    }
  }

  Future<Result<void>> deleteTodo(int todoid) async {
    try {
      final result = await _datasource.deleteTodo(todoid);
      return Result.success(result);
    } catch (error) {
      return const Result.failure('Error deleting Todo');
    }
  }
}
