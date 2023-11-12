import 'package:clean_architecture_todo_app/core/use_cases/use_case.dart';
import 'package:clean_architecture_todo_app/domain/domain.dart';
import 'package:clean_architecture_todo_app/domain/use_cases/delete_todo_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_todo_usecase_test.mocks.dart';

@GenerateMocks(<Type>[TodoRepository])
void main() {
  late DeleteTodoUseCase useCase;
  late MockTodoRepository todoRepository;

  setUp(() {
    todoRepository = MockTodoRepository();
    useCase = DeleteTodoUseCase(todoRepository);
  });

  group('DeleteTodoUseCase', () {
    test('should delete a Todo from the repository', () async {
      final todo = Todo(
        id: 1,
        title: 'Title',
        description: 'Description',
        isDone: false,
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 1),
        untilDate: DateTime(2022, 1, 2),
      );

      when(todoRepository.deleteTodo(todo)).thenAnswer((_) async => true);

      final result = await useCase.call(params: todo);

      expect(result, true);
    });

  });
}
