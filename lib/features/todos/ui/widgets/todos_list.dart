import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../data/model/todo.dart';
import 'todo_list_item.dart';

class TodosList extends StatelessWidget {
  const TodosList({super.key, required this.todos});
  final List<Todo> todos;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
        padding: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.lighterGray,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...todos.map(
              (todo) => TodoListItem(todo: todo),
            ),
          ],
        ));
  }
}
