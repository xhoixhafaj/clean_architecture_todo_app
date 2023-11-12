import 'package:clean_architecture_todo_app/domain/domain.dart';
import 'package:clean_architecture_todo_app/domain/use_cases/get_earliest_todo_date_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_earliest_todo_usecase_test.mocks.dart';

@GenerateMocks(<Type>[TodoRepository])
void main() {
  group('GetEarliestTodoByDateUseCase Tests', () {
    late MockTodoRepository todoRepository;
    late GetEarliestTodoByDateUseCase useCase;

    setUp(() {
      todoRepository = MockTodoRepository();
      useCase = GetEarliestTodoByDateUseCase(todoRepository);
    });

    test('Get the earliest todo date successfully', () async {
      final earliestTodo = Todo(
        id: 1,
        title: 'Title',
        description: 'Description',
        isDone: false,
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 1),
        untilDate: DateTime(2022, 1, 2),
      );

      when(todoRepository.getTheEarliestTodo()).thenAnswer((_) async => earliestTodo);

      final result = await useCase(params: null);

      expect(result, equals(earliestTodo.untilDate));
      verify(todoRepository.getTheEarliestTodo()).called(1);
      verifyNoMoreInteractions(todoRepository);
    });

    test('No todos found, return null', () async {
      when(todoRepository.getTheEarliestTodo()).thenAnswer((_) async => null);
      GetEarliestTodoByDateUseCase useCase = GetEarliestTodoByDateUseCase(todoRepository);
      final result = await useCase(params: null);

      expect(result, isNull);
      verify(todoRepository.getTheEarliestTodo()).called(1);
      verifyNoMoreInteractions(todoRepository);
    });
  });
}

