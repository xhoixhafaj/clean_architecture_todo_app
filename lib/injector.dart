import 'package:clean_architecture_todo_app/data/repository_implementation/todo_db_repository.dart';
import 'package:clean_architecture_todo_app/domain/use_cases/delete_todo_use_case.dart';
import 'package:clean_architecture_todo_app/domain/use_cases/get_todo_by_date_use_case.dart';
import 'package:clean_architecture_todo_app/domain/use_cases/insert_todo_use_case.dart';
import 'package:clean_architecture_todo_app/domain/use_cases/update_todo_use_case.dart';
import 'package:get_it/get_it.dart';

import 'config/config.dart';
import 'domain/domain.dart';
import 'domain/use_cases/get_earliest_todo_date_use_case.dart';

final injector = GetIt.instance;

initializeDependencies() {
  injector.registerSingleton(ThemeService(TodoLightColorScheme()));
  initializeUseCases();
  initializeRepositories();
}

initializeUseCases() {
  injector.registerLazySingleton<GetEarliestTodoByDateUseCase>(() => GetEarliestTodoByDateUseCase(injector()));
  injector.registerLazySingleton<GetTodoByDateTimeUseCase>(() => GetTodoByDateTimeUseCase(injector()));
  injector.registerLazySingleton<DeleteTodoUseCase>(() => DeleteTodoUseCase(injector()));
  injector.registerLazySingleton<InsertTodoUseCase>(() => InsertTodoUseCase(injector()));
  injector.registerLazySingleton<UpdateTodoUseCase>(() => UpdateTodoUseCase(injector()));
}

initializeRepositories() {
  injector.registerLazySingleton<TodoRepository>(() => TodoDbRepository());
}