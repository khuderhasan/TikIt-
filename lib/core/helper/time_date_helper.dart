// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:tikit/features/todos/logic/cubit/todo_cubit.dart';

@immutable
class TimeDateHelpers {
  const TimeDateHelpers._();
  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final date = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
      final formatType = DateFormat.jm();
      return formatType.format(date);
    } catch (e) {
      return '12:00';
    }
  }

  static Future<void> selectDate(BuildContext context) async {
    final initialDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2060),
    );

    if (pickedDate != null) {
      context.read<TodoCubit>().date = dateFormatter(pickedDate);
    }
  }

  // static bool isTaskFromSelectedDate(Task task, DateTime selectedDate) {
  //   final DateTime taskDate = _stringToDateTime(task.date);
  //   if (taskDate.month == selectedDate.month &&
  //       taskDate.year == selectedDate.year &&
  //       taskDate.day == selectedDate.day) {
  //     return true;
  //   }
  //   return false;
  // }

  // static DateTime _stringToDateTime(String dateString) {
  //   try {
  //     DateFormat format = DateFormat.yMMMd();
  //     return format.parse(dateString);
  //   } catch (e) {
  //     return DateTime.now();
  //   }
  // }
  static Future<void> selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      context.read<TodoCubit>().time = timeToString(pickedTime);
    }
  }

  static String dateFormatter(DateTime date) {
    try {
      return DateFormat.yMMMd().format(date);
    } catch (e) {
      return DateFormat.yMMMd().format(
        DateTime.now(),
      );
    }
  }
}
