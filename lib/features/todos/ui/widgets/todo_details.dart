import 'package:flutter/material.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

import '../../data/model/todo.dart';

class TodoDetails extends StatelessWidget {
  const TodoDetails({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: ColorsManager.mainBlue,
            radius: 25,
            child: Icon(Icons.task),
          ),
          verticalSpace(16),
          Text(
            todo.title!,
            style: TextStyles.font20BlackBold,
          ),
          Text(
            todo.time!,
            style: TextStyles.font16BlackRegular,
          ),
          Visibility(
            visible: !todo.isCompleted!,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Task to be completed on '),
                Text(todo.date!),
                const Icon(
                  Icons.check_box,
                  color: ColorsManager.mainBlue,
                ),
              ],
            ),
          ),
          verticalSpace(16),
          const Divider(
            color: Colors.grey,
            thickness: 1.5,
          ),
          verticalSpace(16),
          Text(
            todo.content!.isEmpty
                ? 'There is no additional note for this task'
                : todo.content!,
            style: TextStyles.font22BlackRegular,
            textAlign: TextAlign.center,
          ),
          verticalSpace(16),
          Visibility(
            visible: todo.isCompleted!,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Task Completed',
                  style: TextStyles.font17BlackBold,
                ),
                const Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
