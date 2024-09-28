import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'core/theming/colors.dart';
import 'features/todos/logic/cubit/todo_cubit.dart';
import 'features/todos/ui/todos_screen.dart';

class TikItApp extends StatelessWidget {
  const TikItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => getIt<TodoCubit>()..fetchTodos(),
        child: MaterialApp(
          title: 'Tik It ',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: ColorsManager.mainBlue,
          ),
          home: const TasksScreen(),
        ),
      ),
    );
  }
}
