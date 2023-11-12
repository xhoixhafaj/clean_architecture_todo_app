import 'dart:async';

import 'package:clean_architecture_todo_app/data/data_sources/local/database/todo_dao.dart';
import 'package:clean_architecture_todo_app/data/models/todo_db.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [TodoDb])
abstract class AppDatabase extends FloorDatabase {
  TodoDao get todoDao;
}