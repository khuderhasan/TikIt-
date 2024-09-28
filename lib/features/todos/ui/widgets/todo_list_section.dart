import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/todo_cubit.dart';
import 'no_todos_section.dart';
import 'todos_list.dart';

import '../../data/model/todo.dart';
import 'todo_list_item.dart';

class TasksListSection extends StatelessWidget {
  const TasksListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsetsDirectional.only(top: 15.h),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: BlocBuilder<TodoCubit, TodoState>(
          buildWhen: (previous, current) =>
              current is TodoSuccess || current is TodoError,
          builder: (context, state) {
            return state.maybeWhen(
              success: (todoList) {
                return setupSuccess(todoList, context);
              },
              error: (errorMessage) => Center(
                child: Text(errorMessage),
              ),
              orElse: () {
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}

Widget setupSuccess(List<Todo> todoList, BuildContext context) {
  final unCompletedTodos = context.read<TodoCubit>().unCompletedTodos;
  final completedTodos = context.read<TodoCubit>().completedTodos;
  if (todoList.isNotEmpty) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TodosList(todos: unCompletedTodos),
            verticalSpace(20),
            Visibility(
              visible: completedTodos.isNotEmpty,
              child: Text('Completed', style: TextStyles.font20BlackBold),
            ),
            verticalSpace(5),
            TodosList(
              todos: completedTodos,
            ),
          ],
        ),
      ),
    );
  }
  return const NoTodosSection();
}

class UnCompletedTodos extends StatelessWidget {
  const UnCompletedTodos({super.key, required this.todos});
  final List<Todo> todos;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: 20.h,
        ),
        padding: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.lighterGray,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...todos.map((todo) => TodoListItem(todo: todo)),
          ],
        )

        // ListView.builder(
        //   itemCount: todoList.length,
        //   itemBuilder: (context, index) => TodoListItem(
        //     todo: todoList[index],
        //   ),
        // ),
        );
  }
}
