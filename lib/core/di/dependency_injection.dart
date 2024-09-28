import 'package:get_it/get_it.dart';
import '../database/db_connection.dart';
import '../database/todo_dao.dart';
import '../../features/todos/data/datasource/local_datasource.dart';
import '../../features/todos/data/repository/todos_repo.dart';
import '../../features/todos/logic/cubit/todo_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Todo
  final databaseConnection = await TodoDatabase.instance.database;

  getIt.registerLazySingleton<TodoDao>(
    () => TodoDao(database: databaseConnection),
  );
  getIt.registerLazySingleton<TodosLocalDatasource>(
    () => TodosLocalDatasource(getIt()),
  );
  getIt.registerLazySingleton<TodosRepo>(
    () => TodosRepo(datasource: getIt()),
  );
  getIt.registerFactory<TodoCubit>(() => TodoCubit(getIt<TodosRepo>()));
}
