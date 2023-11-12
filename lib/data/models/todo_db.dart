

import 'package:clean_architecture_todo_app/domain/entities/todo.dart';
import 'package:floor/floor.dart';

@entity
class TodoDb {

  @PrimaryKey(autoGenerate: true)
  final int? idDb;

  final String titleDb;
  final String descriptionDb;
  final bool isDoneDb;
  final int createdAtEpoc;
  final int updatedAtEpoc;
  final int untilDateEpoc;

  TodoDb({
    this.idDb,
    required this.titleDb,
    required this.descriptionDb,
    required this.isDoneDb,
    required this.createdAtEpoc,
    required this.updatedAtEpoc,
    required this.untilDateEpoc,
  });

}

extension TodoDbExtension on TodoDb {
  Todo toTodo() {
    return Todo(
      id: idDb,
      title: titleDb,
      description: descriptionDb,
      isDone: isDoneDb,
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAtEpoc),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedAtEpoc),
      untilDate: DateTime.fromMillisecondsSinceEpoch(untilDateEpoc),
    );
  }
}