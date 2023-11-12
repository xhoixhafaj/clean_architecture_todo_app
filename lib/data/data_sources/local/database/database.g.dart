// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TodoDao? _todoDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TodoDb` (`idDb` INTEGER PRIMARY KEY AUTOINCREMENT, `titleDb` TEXT NOT NULL, `descriptionDb` TEXT NOT NULL, `isDoneDb` INTEGER NOT NULL, `createdAtEpoc` INTEGER NOT NULL, `updatedAtEpoc` INTEGER NOT NULL, `untilDateEpoc` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TodoDao get todoDao {
    return _todoDaoInstance ??= _$TodoDao(database, changeListener);
  }
}

class _$TodoDao extends TodoDao {
  _$TodoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _todoDbInsertionAdapter = InsertionAdapter(
            database,
            'TodoDb',
            (TodoDb item) => <String, Object?>{
                  'idDb': item.idDb,
                  'titleDb': item.titleDb,
                  'descriptionDb': item.descriptionDb,
                  'isDoneDb': item.isDoneDb ? 1 : 0,
                  'createdAtEpoc': item.createdAtEpoc,
                  'updatedAtEpoc': item.updatedAtEpoc,
                  'untilDateEpoc': item.untilDateEpoc
                }),
        _todoDbUpdateAdapter = UpdateAdapter(
            database,
            'TodoDb',
            ['idDb'],
            (TodoDb item) => <String, Object?>{
                  'idDb': item.idDb,
                  'titleDb': item.titleDb,
                  'descriptionDb': item.descriptionDb,
                  'isDoneDb': item.isDoneDb ? 1 : 0,
                  'createdAtEpoc': item.createdAtEpoc,
                  'updatedAtEpoc': item.updatedAtEpoc,
                  'untilDateEpoc': item.untilDateEpoc
                }),
        _todoDbDeletionAdapter = DeletionAdapter(
            database,
            'TodoDb',
            ['idDb'],
            (TodoDb item) => <String, Object?>{
                  'idDb': item.idDb,
                  'titleDb': item.titleDb,
                  'descriptionDb': item.descriptionDb,
                  'isDoneDb': item.isDoneDb ? 1 : 0,
                  'createdAtEpoc': item.createdAtEpoc,
                  'updatedAtEpoc': item.updatedAtEpoc,
                  'untilDateEpoc': item.untilDateEpoc
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TodoDb> _todoDbInsertionAdapter;

  final UpdateAdapter<TodoDb> _todoDbUpdateAdapter;

  final DeletionAdapter<TodoDb> _todoDbDeletionAdapter;

  @override
  Future<TodoDb?> getTodo(String id) async {
    return _queryAdapter.query('SELECT * FROM TodoDb WHERE idDb = ?1',
        mapper: (Map<String, Object?> row) => TodoDb(
            idDb: row['idDb'] as int?,
            titleDb: row['titleDb'] as String,
            descriptionDb: row['descriptionDb'] as String,
            isDoneDb: (row['isDoneDb'] as int) != 0,
            createdAtEpoc: row['createdAtEpoc'] as int,
            updatedAtEpoc: row['updatedAtEpoc'] as int,
            untilDateEpoc: row['untilDateEpoc'] as int),
        arguments: [id]);
  }

  @override
  Future<List<TodoDb>> getTodoByDate(int untilDateEpoc) async {
    return _queryAdapter.queryList(
        'SELECT * FROM TodoDb WHERE untilDateEpoc = ?1',
        mapper: (Map<String, Object?> row) => TodoDb(
            idDb: row['idDb'] as int?,
            titleDb: row['titleDb'] as String,
            descriptionDb: row['descriptionDb'] as String,
            isDoneDb: (row['isDoneDb'] as int) != 0,
            createdAtEpoc: row['createdAtEpoc'] as int,
            updatedAtEpoc: row['updatedAtEpoc'] as int,
            untilDateEpoc: row['untilDateEpoc'] as int),
        arguments: [untilDateEpoc]);
  }

  @override
  Future<TodoDb?> getTodoWithEarliestUntilDate() async {
    return _queryAdapter.query(
        'SELECT * FROM TodoDb ORDER BY untilDateEpoc ASC LIMIT 1',
        mapper: (Map<String, Object?> row) => TodoDb(
            idDb: row['idDb'] as int?,
            titleDb: row['titleDb'] as String,
            descriptionDb: row['descriptionDb'] as String,
            isDoneDb: (row['isDoneDb'] as int) != 0,
            createdAtEpoc: row['createdAtEpoc'] as int,
            updatedAtEpoc: row['updatedAtEpoc'] as int,
            untilDateEpoc: row['untilDateEpoc'] as int));
  }

  @override
  Future<void> insertTodo(TodoDb todoDb) async {
    await _todoDbInsertionAdapter.insert(todoDb, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateTodo(TodoDb todoDb) async {
    await _todoDbUpdateAdapter.update(todoDb, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTodo(TodoDb todoDb) async {
    await _todoDbDeletionAdapter.delete(todoDb);
  }
}
