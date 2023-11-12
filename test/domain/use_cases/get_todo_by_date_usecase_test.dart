import 'package:clean_architecture_todo_app/core/use_cases/use_case.dart';
import 'package:clean_architecture_todo_app/domain/domain.dart';
import 'package:clean_architecture_todo_app/domain/use_cases/get_todo_by_date_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_todo_by_date_usecase_test.mocks.dart';


@GenerateMocks(<Type>[TodoRepository])
void main() {
  late GetTodoByDateTimeUseCase useCase;
  late MockTodoRepository todoRepository;

  setUp(() {
    todoRepository = MockTodoRepository();
    useCase = GetTodoByDateTimeUseCase(todoRepository);
  });

  group('GetTodoByDateTimeUseCase', () {
    test('should return a list of Todos from the repository', () async {
      // Arrange
      final dateTime = DateTime(2022, 1, 2);
      final expectedTodos = [Todo(
        id: 1,
        title: 'Title',
        description: 'Description',
        isDone: false,
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 1),
        untilDate: DateTime(2022, 1, 2),
      )];

      when(todoRepository.getTodosByDateTime(dateTime))
          .thenAnswer((_) async => expectedTodos);

      // Act
      final result = await useCase(params: dateTime);

      // Assert
      expect(result, expectedTodos);
      verify(todoRepository.getTodosByDateTime(dateTime));
      verifyNoMoreInteractions(todoRepository);
    });
  });
}
