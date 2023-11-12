// Mocks generated by Mockito 5.4.2 from annotations
// in clean_architecture_todo_app/test/domain/use_cases/update_todo_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:clean_architecture_todo_app/domain/entities/todo.dart' as _i4;
import 'package:clean_architecture_todo_app/domain/repositories/todo_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [TodoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRepository extends _i1.Mock implements _i2.TodoRepository {
  MockTodoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Todo?> getTodo(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getTodo,
          [id],
        ),
        returnValue: _i3.Future<_i4.Todo?>.value(),
      ) as _i3.Future<_i4.Todo?>);

  @override
  _i3.Future<_i4.Todo?> getTheEarliestTodo() => (super.noSuchMethod(
        Invocation.method(
          #getTheEarliestTodo,
          [],
        ),
        returnValue: _i3.Future<_i4.Todo?>.value(),
      ) as _i3.Future<_i4.Todo?>);

  @override
  _i3.Future<List<_i4.Todo>> getTodosByDateTime(DateTime? dateTime) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTodosByDateTime,
          [dateTime],
        ),
        returnValue: _i3.Future<List<_i4.Todo>>.value(<_i4.Todo>[]),
      ) as _i3.Future<List<_i4.Todo>>);

  @override
  _i3.Future<bool> insertTodo(_i4.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #insertTodo,
          [todo],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> updateTodo(_i4.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #updateTodo,
          [todo],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> deleteTodo(_i4.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #deleteTodo,
          [todo],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
