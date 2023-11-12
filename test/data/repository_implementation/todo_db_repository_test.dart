import 'package:clean_architecture_todo_app/data/data_sources/local/database/todo_dao.dart';
import 'package:clean_architecture_todo_app/data/repository_implementation/todo_db_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:clean_architecture_todo_app/data/data_sources/local/database/database.dart';
import 'package:clean_architecture_todo_app/data/models/todo_db.dart';
import 'package:clean_architecture_todo_app/domain/entities/todo.dart';

import 'todo_db_repository_test.mocks.dart';

@GenerateMocks([AppDatabase, TodoDao])
void main() {
  late TodoDbRepository todoRepository;
  late MockAppDatabase mockDatabase;
  late MockTodoDao mockTodoDao;

  setUp(() {
    mockDatabase = MockAppDatabase();
    mockTodoDao = MockTodoDao();
    when(mockDatabase.todoDao).thenReturn(mockTodoDao);
    todoRepository = TodoDbRepository();
    todoRepository.database = mockDatabase;
  });

  test('deleteTodo should call deleteTodo on TodoDao', () async {

    final createdAt = DateTime.fromMillisecondsSinceEpoch(0);
    final updatedAt = DateTime.fromMillisecondsSinceEpoch(0);
    final untilDate = DateTime.fromMillisecondsSinceEpoch(0);

    final todo = Todo(
        id: 1,
        title: 'Test Todo',
        isDone: false,
        description: 'Description',
        createdAt: createdAt,
        updatedAt: updatedAt,
        untilDate: untilDate,
    );
    final todoDb = _todoToTodoDb(todo);
    when(mockTodoDao.deleteTodo(todoDb)).thenAnswer((_) async {});

    await todoRepository.deleteTodo(todo);

    verify(mockTodoDao.deleteTodo(any)).called(1);
  });

  test('update Todo should call update on TodoDao', () async {

    final createdAt = DateTime.fromMillisecondsSinceEpoch(0);
    final updatedAt = DateTime.fromMillisecondsSinceEpoch(0);
    final untilDate = DateTime.fromMillisecondsSinceEpoch(0);

    final todo = Todo(
      id: 1,
      title: 'Test Todo',
      isDone: false,
      description: 'Description',
      createdAt: createdAt,
      updatedAt: updatedAt,
      untilDate: untilDate,
    );
    final todoDb = _todoToTodoDb(todo);
    when(mockTodoDao.updateTodo(todoDb)).thenAnswer((_) async {});

    await todoRepository.updateTodo(todo);

    verify(mockTodoDao.updateTodo(any)).called(1);
  });

  test('insert Todo should call insertTodo on TodoDao', () async {

    final createdAt = DateTime.fromMillisecondsSinceEpoch(0);
    final updatedAt = DateTime.fromMillisecondsSinceEpoch(0);
    final untilDate = DateTime.fromMillisecondsSinceEpoch(0);

    final todo = Todo(
      id: 1,
      title: 'Test Todo',
      isDone: false,
      description: 'Description',
      createdAt: createdAt,
      updatedAt: updatedAt,
      untilDate: untilDate,
    );
    final todoDb = _todoToTodoDb(todo);
    when(mockTodoDao.insertTodo(todoDb)).thenAnswer((_) async {});

    await todoRepository.insertTodo(todo);

    verify(mockTodoDao.insertTodo(any)).called(1);
  });

  test('getTodo should call getTodo on TodoDao', () async {
    const todoId = '1';
    final todoDb = TodoDb(
      idDb: 1,
      titleDb: 'Test Todo',
      descriptionDb: 'Description',
      isDoneDb: false,
      createdAtEpoc: 0,
      updatedAtEpoc: 0,
      untilDateEpoc: 0,
    );
    when(mockTodoDao.getTodo(todoId)).thenAnswer((_) async => todoDb);

    final result = await todoRepository.getTodo(todoId);

    verify(mockTodoDao.getTodo(todoId)).called(1);
    expect(result, todoDb.toTodo());
  });

  test('getTodo by date should call getTodoByDate on TodoDao', () async {
    const date = 0;
    final todoDb = TodoDb(
      idDb: 1,
      titleDb: 'Test Todo',
      descriptionDb: 'Description',
      isDoneDb: false,
      createdAtEpoc: 0,
      updatedAtEpoc: 0,
      untilDateEpoc: date,
    );
    when(mockTodoDao.getTodoByDate(date)).thenAnswer((_) async => [todoDb]);

    final result = await todoRepository.getTodosByDateTime(DateTime.fromMillisecondsSinceEpoch(date));

    verify(mockTodoDao.getTodoByDate(date)).called(1);
    expect(result.any((element) => element.untilDate.millisecondsSinceEpoch != date), false);
  });

  test('get earliest Todo should call getEarliestTodo on TodoDao', () async {
    const date = 0;
    final todoDb = TodoDb(
      idDb: 1,
      titleDb: 'Test Todo',
      descriptionDb: 'Description',
      isDoneDb: false,
      createdAtEpoc: 0,
      updatedAtEpoc: 0,
      untilDateEpoc: date,
    );
    when(mockTodoDao.getTodoWithEarliestUntilDate()).thenAnswer((_) async => todoDb);

    final result = await todoRepository.getTheEarliestTodo();

    verify(mockTodoDao.getTodoWithEarliestUntilDate()).called(1);
    expect(result, todoDb.toTodo());
  });


  tearDown(() {
    reset(mockDatabase);
  });

}

TodoDb _todoToTodoDb(Todo todo) {
  return TodoDb(
    idDb: todo.id ?? 0,
    titleDb: todo.title,
    descriptionDb: todo.description,
    isDoneDb: todo.isDone,
    createdAtEpoc: todo.createdAt.millisecondsSinceEpoch,
    updatedAtEpoc: todo.updatedAt.millisecondsSinceEpoch,
    untilDateEpoc: todo.untilDate.millisecondsSinceEpoch,
  );
}
