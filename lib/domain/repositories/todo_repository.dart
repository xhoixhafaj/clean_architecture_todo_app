import 'package:clean_architecture_todo_app/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<Todo?> getTodo(String id);
  Future<Todo?> getTheEarliestTodo();
  Future<List<Todo>> getTodosByDateTime(DateTime dateTime);
  Future<bool> insertTodo(Todo todo);
  Future<bool> updateTodo(Todo todo);
  Future<bool> deleteTodo(Todo todo);
}