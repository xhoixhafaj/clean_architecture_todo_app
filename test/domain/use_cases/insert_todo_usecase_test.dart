import 'package:clean_architecture_todo_app/domain/use_cases/insert_todo_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:clean_architecture_todo_app/domain/domain.dart';

import 'insert_todo_usecase_test.mocks.dart';


@GenerateMocks(<Type>[TodoRepository])
void main() {
  test('InsertTodoUseCase inserts a todo', () async {
    // Arrange
    final mockTodoRepository = MockTodoRepository();
    final insertTodoUseCase = InsertTodoUseCase(mockTodoRepository);
    final todo = Todo(
      id: 1,
      title: 'Title',
      description: 'Description',
      isDone: false,
      createdAt: DateTime(2022, 1, 1),
      updatedAt: DateTime(2022, 1, 1),
      untilDate: DateTime(2022, 1, 2),
    );

    // Act
    when(mockTodoRepository.insertTodo(todo)).thenAnswer((_) async => true);
    await insertTodoUseCase.call(params: todo);

    verify(mockTodoRepository.insertTodo(todo)).called(1);
  });
}
