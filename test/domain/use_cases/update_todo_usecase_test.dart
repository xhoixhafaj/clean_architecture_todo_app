import 'package:clean_architecture_todo_app/domain/use_cases/update_todo_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:clean_architecture_todo_app/domain/domain.dart';

import 'update_todo_usecase_test.mocks.dart';


@GenerateMocks(<Type>[TodoRepository])
void main() {
  test('UpdateTodoUseCase updates a todo', () async {
    // Arrange
    final mockTodoRepository = MockTodoRepository();
    final updateTodoUseCase = UpdateTodoUseCase(mockTodoRepository);
    final todo = Todo(
      id: 1,
      title: 'Title',
      description: 'Description',
      isDone: false,
      createdAt: DateTime(2022, 1, 1),
      updatedAt: DateTime(2022, 1, 1),
      untilDate: DateTime(2022, 1, 2),
    );

    when(mockTodoRepository.updateTodo(todo)).thenAnswer((_) async => true);
    await updateTodoUseCase.call(params: todo);

    verify(mockTodoRepository.updateTodo(todo)).called(1);
  });
}
