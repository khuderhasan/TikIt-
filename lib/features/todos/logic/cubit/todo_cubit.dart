import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/todo.dart';
import '../../data/repository/todos_repo.dart';

import '../../../../core/helper/time_date_helper.dart';

part 'todo_state.dart';
part 'todo_cubit.freezed.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodosRepo _todosRepo;
  TodoCubit(this._todosRepo) : super(const TodoState.initial());
  TextEditingController titleController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  String time = TimeDateHelpers.timeToString(TimeOfDay.now());
  String date = TimeDateHelpers.dateFormatter(DateTime.now());

  List<Todo> completedTodos = [];
  List<Todo> unCompletedTodos = [];

  void fetchTodos() async {
    final response = await _todosRepo.fetchTodos();
    response.when(success: (todosList) {
      completedTodos = todosList.where((todo) => todo.isCompleted!).toList();
      unCompletedTodos = todosList.where((todo) => !todo.isCompleted!).toList();
      emit(TodoState.success(todosList));
    }, failure: (error) {
      emit(TodoState.error(error));
    });
  }

  void addTodo() async {
    final response = await _todosRepo.addTodo(Todo(
      title: titleController.text,
      content: notesController.text,
      time: time,
      date: date,
      isCompleted: false,
    ));
    response.when(success: (todo) {
      fetchTodos();
      dispose();
    }, failure: (error) {
      emit(TodoState.error(error));
    });
  }

  void updateTodo(Todo todo) async {
    final response = await _todosRepo
        .updateTodo(todo.copyWith(isCompleted: !todo.isCompleted!));
    response.when(success: (todo) {
      fetchTodos();
    }, failure: (error) {
      emit(TodoState.error(error));
    });
  }

  void deleteTodo(int todoId) async {
    final response = await _todosRepo.deleteTodo(todoId);
    response.when(success: (todo) {
      fetchTodos();
    }, failure: (error) {
      emit(TodoState.error(error));
    });
  }

  void dispose() {
    titleController.clear();
    notesController.clear();
  }
}
