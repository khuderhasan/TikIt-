import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/model/todo.dart';
import '../../logic/cubit/todo_cubit.dart';
import 'todo_details.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return TodoDetails(todo: todo);
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 55.h,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
                leading: IconButton(
                  icon: todo.isCompleted == false
                      ? const Icon(Icons.check_box_outline_blank)
                      : const Icon(
                          Icons.check_box_rounded,
                          color: ColorsManager.mainBlue,
                        ),
                  onPressed: () => context.read<TodoCubit>().updateTodo(todo),
                ),
                title: Text(
                  todo.title!,
                  style: todo.isCompleted!
                      ? TextStyles.font17BlackBold.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: ColorsManager.mainBlue)
                      : TextStyles.font17BlackBold,
                ),
                subtitle: Text(
                  todo.time!,
                  style: todo.isCompleted!
                      ? TextStyles.font15BlackRegular.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: ColorsManager.mainBlue)
                      : TextStyles.font15BlackRegular,
                ),
                trailing: IconButton(
                  onPressed: () =>
                      context.read<TodoCubit>().deleteTodo(todo.id!),
                  icon: const Icon(Icons.delete),
                  color: ColorsManager.heavyRed,
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
