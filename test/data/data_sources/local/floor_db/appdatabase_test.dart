import 'package:clean_architecture_todo_app/data/data_sources/local/database/database.dart';
import 'package:clean_architecture_todo_app/data/models/todo_db.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_todo_app/data/data_sources/local/database/todo_dao.dart';

void main() {

  late AppDatabase database;

  late TodoDao todoDao;

  setUp(() async {
    database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
    todoDao = database.todoDao;
  });

  tearDown(() async {
    await database.close();
  });

  test('Insert and query todo', () async {
    final todoDb = TodoDb(
      titleDb: 'Test Title',
      descriptionDb: 'Test Description',
      isDoneDb: false,
      createdAtEpoc: 1636310400000,
      updatedAtEpoc: 1636310410000,
      untilDateEpoc: 1636310420000,
    );

    await todoDao.insertTodo(todoDb);

    final todos = await todoDao.getTodoByDate(1636310420000);

    expect(todos.length, 1);

  });

  test('Delete and query todo', () async {
    final todoDb = TodoDb(
      titleDb: 'test 1',
      descriptionDb: 'Test Description',
      isDoneDb: false,
      createdAtEpoc: 1636310400000,
      updatedAtEpoc: 1636310410000,
      untilDateEpoc: 1636310420000,
    );

    await todoDao.insertTodo(todoDb);

    final todos = await todoDao.getTodoByDate(1636310420000);

    await todoDao.deleteTodo(todos.first);

    final todos2 = await todoDao.getTodoByDate(1636310420000);

    expect(todos2.length, 0);

  });

  test('Get todo by id (null) and query todo', () async {
    final todoDb = TodoDb(
      titleDb: 'test 1',
      descriptionDb: 'Test Description',
      isDoneDb: false,
      createdAtEpoc: 1636310400000,
      updatedAtEpoc: 1636310410000,
      untilDateEpoc: 1636310420000,
    );

    await todoDao.insertTodo(todoDb);

    final todos = await todoDao.getTodoByDate(1636310420000);

    await todoDao.deleteTodo(todos.first);

    final newTodo = await todoDao.getTodo(todos.first.idDb?.toString() ?? '');

    expect(newTodo, isNull);

  });

  test('Get todo by id (not null) and query todo', () async {
    final todoDb = TodoDb(
      titleDb: 'test 1',
      descriptionDb: 'Test Description',
      isDoneDb: false,
      createdAtEpoc: 1636310400000,
      updatedAtEpoc: 1636310410000,
      untilDateEpoc: 1636310420000,
    );

    await todoDao.insertTodo(todoDb);

    final todos = await todoDao.getTodoByDate(1636310420000);

    final newTodo = await todoDao.getTodo(todos.first.idDb?.toString() ?? '');

    expect(newTodo?.idDb, todos.first.idDb);

  });

  test('Get earliest todo and query todo', () async {
    final todoDb = TodoDb(
      titleDb: 'test 1',
      descriptionDb: 'Test Description',
      isDoneDb: false,
      createdAtEpoc: 1636310400000,
      updatedAtEpoc: 1636310410000,
      untilDateEpoc: 1636310420000,
    );

    await todoDao.insertTodo(todoDb);

    final earliestTodoDb = TodoDb(
      titleDb: 'test 1',
      descriptionDb: 'Test Description',
      isDoneDb: false,
      createdAtEpoc: 1636310400000,
      updatedAtEpoc: 1636310410000,
      untilDateEpoc: 1636310000000,
    );

    await todoDao.insertTodo(earliestTodoDb);

    final todo = await todoDao.getTodoWithEarliestUntilDate();

    expect(todo?.untilDateEpoc, earliestTodoDb.untilDateEpoc);

  });

  test('Get by date and query todo', () async {
    final todoDb = TodoDb(
      titleDb: 'test 1',
      descriptionDb: 'Test Description',
      isDoneDb: false,
      createdAtEpoc: 1636310400000,
      updatedAtEpoc: 1636310410000,
      untilDateEpoc: 1636310420000,
    );

    await todoDao.insertTodo(todoDb);

    final todos = await todoDao.getTodoByDate(1636310420000);

    expect(todos.any((todo) => todo.untilDateEpoc != 1636310420000), false);

  });

  test('Update and query todo', () async {
    final todoDb = TodoDb(
      titleDb: 'test 1',
      descriptionDb: 'Test Description',
      isDoneDb: false,
      createdAtEpoc: 1636310400000,
      updatedAtEpoc: 1636310410000,
      untilDateEpoc: 1636310420000,
    );

    await todoDao.insertTodo(todoDb);

    final todoDb2 = TodoDb(
      titleDb: 'test 2',
      descriptionDb: 'Test Description',
      isDoneDb: false,
      createdAtEpoc: 1636310400000,
      updatedAtEpoc: 1636310410000,
      untilDateEpoc: 1636310420000,
    );

    await todoDao.insertTodo(todoDb2);

    final todos = await todoDao.getTodoByDate(1636310420000);

    const todoDbTitle3 = 'test 3';

    final todoDb3 = TodoDb(
      idDb: todos[1].idDb,
      titleDb: todoDbTitle3,
      descriptionDb: 'Test Description',
      isDoneDb: false,
      createdAtEpoc: 1636310400000,
      updatedAtEpoc: 1636310410000,
      untilDateEpoc: 1636310420000,
    );

    await todoDao.updateTodo(todoDb3);

    final todos2 = await todoDao.getTodoByDate(1636310420000);

    expect(todos2.any((todo) {
      return todo.titleDb == todoDbTitle3;
    }), true);
  });

}
