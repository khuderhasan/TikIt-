import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/styles.dart';

class NoTodosSection extends StatelessWidget {
  const NoTodosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svgs/empty_tasks.svg',
          height: 150.h,
          width: 100.w,
        ),
        verticalSpace(25),
        Text(
          'What do you want to do Today ?',
          style: TextStyles.font20BlackRegular,
        ),
        verticalSpace(10),
        Text(
          'Tap + to add your tasks',
          style: TextStyles.font16BlackRegular,
        ),
      ],
    );
  }
}
