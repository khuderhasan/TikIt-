import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import 'widgets/add_todo_button.dart';
import 'widgets/todo_list_section.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          backgroundColor: ColorsManager.mainBlue,
          floatingActionButton: AddTaskButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TikItHeaderSection(),
              TasksListSection(),
            ],
          )),
    );
  }
}

class TikItHeaderSection extends StatelessWidget {
  const TikItHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      padding: EdgeInsetsDirectional.only(
        top: 20.h,
        start: 30.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/svgs/tasks_icon.svg',
                width: 30.w,
                height: 70.h,
              ),
              Text(
                "Tik It",
                style: TextStyles.font55WhiteBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
