
import 'package:clean_architecture_todo_app/domain/domain.dart';
import 'package:clean_architecture_todo_app/domain/use_cases/delete_todo_use_case.dart';
import 'package:clean_architecture_todo_app/domain/use_cases/get_earliest_todo_date_use_case.dart';
import 'package:clean_architecture_todo_app/injector.dart';
import 'package:clean_architecture_todo_app/presentation/splash/cubit/splash_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'splash_cubit_test.mocks.dart';

@GenerateMocks(<Type>[GetEarliestTodoByDateUseCase])
void main() {
  late SplashCubit splashCubit;
  late GetEarliestTodoByDateUseCase mockGetEarliestTodoByDateUseCase;

  setUp(() {
    injector.registerLazySingleton<GetEarliestTodoByDateUseCase>(() => MockGetEarliestTodoByDateUseCase());
    mockGetEarliestTodoByDateUseCase = injector.get<GetEarliestTodoByDateUseCase>();
    splashCubit = SplashCubit();
  });

  group('Splash cubit', () {
    test('getEarliestTodo return a date', () async {

      final untilDate = DateTime(2022, 1, 2);

      when(mockGetEarliestTodoByDateUseCase(params: null)).thenAnswer((_) async => untilDate);

      await splashCubit.init();

      expect(splashCubit.state, equals(SplashState.success(dateTime: untilDate)));

    });

    test('getEarliestTodo return a null date', () async {
      const untilDate = null;

      when(mockGetEarliestTodoByDateUseCase(params: null)).thenAnswer((_) async => untilDate);

      await splashCubit.init();

      expect(splashCubit.state, equals(SplashState.success(dateTime: untilDate)));

    });

    tearDown(() async {
      await injector.reset();
    });

  });
}