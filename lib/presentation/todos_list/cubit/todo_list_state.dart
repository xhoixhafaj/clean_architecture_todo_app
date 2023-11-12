part of 'todo_list_cubit.dart';

@freezed
class TodoListState with _$TodoListState {
  const factory TodoListState({
    @Default([]) List<WeeklyTodos> weeklyTodos,
    @Default(null) DateTime? firstTodoDate,
    @Default(0) int currentPageIndex,
  }) = _TodoListState;
}

@freezed
class TodoListStatusState with _$TodoListStatusState {
  const factory TodoListStatusState.initial() = _Initial;

  const factory TodoListStatusState.loading() = _Loading;

  const factory TodoListStatusState.failed() = _Failed;

  const factory TodoListStatusState.success() = _Success;
}

class WeeklyTodos extends Equatable {
  const WeeklyTodos({
    required this.weeklyTodos,
    required this.weekNumber,
    this.statusState = const TodoListStatusState.initial(),
  });

  final List<DailyTodoList> weeklyTodos;
  final int weekNumber;
  final TodoListStatusState statusState;

  @override
  List<Object?> get props => [weeklyTodos, weekNumber, statusState];

  WeeklyTodos copyWith({
    List<DailyTodoList>? weeklyTodos,
    int? weekNumber,
    TodoListStatusState? statusState,
  }) {
    return WeeklyTodos(
      weeklyTodos: weeklyTodos ?? this.weeklyTodos,
      weekNumber: weekNumber ?? this.weekNumber,
      statusState: statusState ?? this.statusState,
    );
  }

}

class DailyTodoList extends Equatable {
  const DailyTodoList({
    required this.todos,
    required this.date,
    this.statusState = const TodoListStatusState.initial(),
  });

  final List<Todo> todos;
  final DateTime date;
  final TodoListStatusState statusState;

  @override
  List<Object?> get props => [
        todos,
        date,
        statusState,
      ];
}
