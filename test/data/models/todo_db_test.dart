import 'package:clean_architecture_todo_app/data/models/todo_db.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_todo_app/domain/entities/todo.dart';

void main() {
  group('TodoDb', () {
    test('TodoDb should be created correctly', () {

      final todoDb = TodoDb(
        titleDb: 'Test Title',
        descriptionDb: 'Test Description',
        isDoneDb: false,
        createdAtEpoc: 1636310400000,
        updatedAtEpoc: 1636310410000,
        untilDateEpoc: 1636310420000,
      );

      expect(todoDb.titleDb, 'Test Title');
      expect(todoDb.descriptionDb, 'Test Description');
      expect(todoDb.isDoneDb, false);
      expect(todoDb.createdAtEpoc, 1636310400000);
      expect(todoDb.updatedAtEpoc, 1636310410000);
      expect(todoDb.untilDateEpoc, 1636310420000);
    });
  });

  group('TodoDbExtension', () {
    test('toTodo should convert TodoDb to Todo', () {

      final todoDb = TodoDb(
        titleDb: 'Test Title',
        descriptionDb: 'Test Description',
        isDoneDb: false,
        createdAtEpoc: 1636310400000,
        updatedAtEpoc: 1636310410000,
        untilDateEpoc: 1636310420000,
      );

      final todo = todoDb.toTodo();

      expect(todo.title, 'Test Title');
      expect(todo.description, 'Test Description');
      expect(todo.isDone, false);
      expect(todo.createdAt, DateTime.fromMillisecondsSinceEpoch(1636310400000));
      expect(todo.updatedAt, DateTime.fromMillisecondsSinceEpoch(1636310410000));
      expect(todo.untilDate, DateTime.fromMillisecondsSinceEpoch(1636310420000));
    });
  });
}
