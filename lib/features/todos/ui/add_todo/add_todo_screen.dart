import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/cubit/todo_cubit.dart';
import 'widgets/save_buttun.dart';
import 'widgets/select_date_time.dart';
import '../../../../core/widgets/app_text_field.dart';

import '../../../../core/theming/styles.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Todo',
          style: TextStyles.font22WhiteBold,
        ),
        centerTitle: true,
        backgroundColor: ColorsManager.mainBlue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsetsDirectional.only(top: 20.h, start: 20.w, end: 20.w),
          child: Column(
            children: [
              AppTextField(
                hintText: 'Todo Title',
                title: 'Todo Title',
                controller: context.read<TodoCubit>().titleController,
              ),
              verticalSpace(25),
              const SelectDateTime(),
              verticalSpace(25),
              AppTextField(
                hintText: 'Notes',
                title: 'Notes',
                maxLines: 6,
                controller: context.read<TodoCubit>().notesController,
              ),
              verticalSpace(30),
              const SaveButton(),
            ],
          ),
        ),
      ),
    ));
  }
}
