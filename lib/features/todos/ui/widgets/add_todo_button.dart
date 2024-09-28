import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../add_todo/add_todo_screen.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // addTodo(context);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddTodoScreen(),
          ),
        );
      },
      backgroundColor: ColorsManager.mainBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: const Icon(Icons.add),
    );
  }
}
