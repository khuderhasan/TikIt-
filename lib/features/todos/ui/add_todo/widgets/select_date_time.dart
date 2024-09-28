import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/time_date_helper.dart';
import '../../../logic/cubit/todo_cubit.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/helper/spacing.dart';

class SelectDateTime extends StatefulWidget {
  const SelectDateTime({super.key});

  @override
  State<SelectDateTime> createState() => _SelectDateTimeState();
}

class _SelectDateTimeState extends State<SelectDateTime> {
  final initalTime = TimeDateHelpers.timeToString(TimeOfDay.now());
  final intialDate = TimeDateHelpers.dateFormatter(DateTime.now());
  @override
  Widget build(BuildContext context) {
    context.read<TodoCubit>().time = initalTime;
    context.read<TodoCubit>().date = intialDate;
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            title: 'Date',
            hintText: context.read<TodoCubit>().date,
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () async {
                await TimeDateHelpers.selectDate(context);
                setState(() {});
              },
              icon: const Icon(Icons.calendar_month_outlined),
            ),
          ),
        ),
        horizontalSpace(10),
        Expanded(
          child: AppTextField(
            title: 'Time',
            hintText: context.read<TodoCubit>().time,
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () async {
                await TimeDateHelpers.selectTime(context);
                setState(() {});
              },
              icon: const Icon(Icons.watch_later_outlined),
            ),
          ),
        ),
      ],
    );
  }
}
