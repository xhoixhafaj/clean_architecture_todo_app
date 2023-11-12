import 'package:clean_architecture_todo_app/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Todo Tests', () {
    test('Two identical Todo objects should be equal', () {
      final todo1 = Todo(
        id: 1,
        title: 'Test Title',
        description: 'Test Description',
        isDone: false,
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 1),
        untilDate: DateTime(2022, 1, 2),
      );

      final todo2 = Todo(
        id: 1,
        title: 'Test Title',
        description: 'Test Description',
        isDone: false,
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 1),
        untilDate: DateTime(2022, 1, 2),
      );

      expect(todo1, equals(todo2));
    });

    test('CopyWith should create a new Todo with the specified changes', () {
      final originalTodo = Todo(
        id: 1,
        title: 'Original Title',
        description: 'Original Description',
        isDone: false,
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 1),
        untilDate: DateTime(2022, 1, 2),
      );

      final updatedTodo = originalTodo.copyWith(
        title: 'Updated Title',
        isDone: true,
        updatedAt: DateTime(2022, 1, 3),
      );

      expect(updatedTodo.id, equals(originalTodo.id)); // ID should remain the same
      expect(updatedTodo.title, equals('Updated Title'));
      expect(updatedTodo.description, equals(originalTodo.description)); // Description is not changed
      expect(updatedTodo.isDone, isTrue);
      expect(updatedTodo.createdAt, equals(originalTodo.createdAt)); // CreatedAt remains the same
      expect(updatedTodo.updatedAt, equals(DateTime(2022, 1, 3)));
      expect(updatedTodo.untilDate, equals(originalTodo.untilDate)); // UntilDate remains the same
    });

    test('Todo instances with different properties should not be equal', () {
      final todo1 = Todo(
        id: 1,
        title: 'Title 1',
        description: 'Description 1',
        isDone: false,
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 1),
        untilDate: DateTime(2022, 1, 2),
      );

      final todo2 = Todo(
        id: 2,
        title: 'Title 2',
        description: 'Description 2',
        isDone: true,
        createdAt: DateTime(2022, 1, 2),
        updatedAt: DateTime(2022, 1, 2),
        untilDate: DateTime(2022, 1, 3),
      );

      expect(todo1, isNot(equals(todo2)));
    });
  });
}
