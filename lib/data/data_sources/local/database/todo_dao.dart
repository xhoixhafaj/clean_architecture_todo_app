import 'package:clean_architecture_todo_app/data/models/todo_db.dart';
import 'package:floor/floor.dart';

@dao
abstract class TodoDao {

  @Query('SELECT * FROM TodoDb WHERE idDb = :id')
  Future<TodoDb?> getTodo(String id);

  @Query('SELECT * FROM TodoDb WHERE untilDateEpoc = :untilDateEpoc')
  Future<List<TodoDb>> getTodoByDate(int untilDateEpoc);

  @Query('SELECT * FROM TodoDb ORDER BY untilDateEpoc ASC LIMIT 1')
  Future<TodoDb?> getTodoWithEarliestUntilDate();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTodo(TodoDb todoDb);

  @update
  Future<void> updateTodo(TodoDb todoDb);

  @delete
  Future<void> deleteTodo(TodoDb todoDb);

}