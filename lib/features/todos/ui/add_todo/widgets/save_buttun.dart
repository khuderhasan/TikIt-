import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../logic/cubit/todo_cubit.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(ColorsManager.mainBlue),
          minimumSize: WidgetStatePropertyAll(Size(200.w, 40.h))),
      onPressed: () {
        context.read<TodoCubit>().addTodo();

        Navigator.of(context).pop();
      },
      child: Text(
        'Save',
        style: TextStyles.font20WhiteRegular,
      ),
    );
  }
}
