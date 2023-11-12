

import 'package:clean_architecture_todo_app/data/data_sources/local/database/database.dart';
import 'package:clean_architecture_todo_app/data/models/todo_db.dart';
import 'package:clean_architecture_todo_app/domain/entities/todo.dart';
import 'package:clean_architecture_todo_app/domain/repositories/todo_repository.dart';

class TodoDbRepository extends TodoRepository {

  TodoDbRepository();

  static const databaseName = 'CleanArchitectureTodoApp.db';


  AppDatabase? database;

  Future<AppDatabase> _initDatabase() async {
    database = await $FloorAppDatabase.databaseBuilder(databaseName).build();
    return database!;
  }

  @override
  Future<bool> deleteTodo(Todo todo) async {
    database ??= await _initDatabase();
    final todoDb = _todoToTodoDb(todo);
    final todoDao = database?.todoDao;
    try {
      await todoDao?.deleteTodo(todoDb);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Todo?> getTodo(String id) async {
    database ??= await _initDatabase();
    final todoDb = await database?.todoDao.getTodo(id);
    return todoDb?.toTodo();
  }

  @override
  Future<bool> insertTodo(Todo todo) async {
    database ??= await _initDatabase();
    final todoDb = _todoToTodoDb(todo);
    try {
      await database?.todoDao.insertTodo(todoDb);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateTodo(Todo todo) async {
    database ??= await _initDatabase();
    final todoDb = _todoToTodoDb(todo);
    try {
      await database?.todoDao.updateTodo(todoDb);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Todo>> getTodosByDateTime(DateTime dateTime) async {
    database ??= await _initDatabase();
    final todoDbs = await database?.todoDao.getTodoByDate(dateTime.millisecondsSinceEpoch);
    if (todoDbs == null) {
      return [];
    }
    final todos = todoDbs.map((e) => e.toTodo()).toList();
    return todos;
  }

  @override
  Future<Todo?> getTheEarliestTodo() async {
    database ??= await _initDatabase();
    final todoDb = await database?.todoDao.getTodoWithEarliestUntilDate();
    return todoDb?.toTodo();
  }


  TodoDb _todoToTodoDb(Todo todo) {
    return TodoDb(
      idDb: todo.id,
      titleDb: todo.title,
      descriptionDb: todo.description,
      isDoneDb: todo.isDone,
      createdAtEpoc: todo.createdAt.millisecondsSinceEpoch,
      updatedAtEpoc: todo.updatedAt.millisecondsSinceEpoch,
      untilDateEpoc: todo.untilDate.millisecondsSinceEpoch,
    );
  }

}