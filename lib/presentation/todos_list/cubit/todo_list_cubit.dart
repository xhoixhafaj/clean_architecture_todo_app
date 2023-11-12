import 'package:clean_architecture_todo_app/domain/domain.dart';
import 'package:clean_architecture_todo_app/domain/use_cases/get_todo_by_date_use_case.dart';
import 'package:clean_architecture_todo_app/injector.dart';
import 'package:clean_architecture_todo_app/utils/extension/date_time_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list_state.dart';

part 'todo_list_cubit.freezed.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit({required this.firstTodoDate})
      : super(TodoListState(
          firstTodoDate: firstTodoDate,
        ));

  final DateTime? firstTodoDate;

  final GetTodoByDateTimeUseCase _getTodoByDateTimeUseCase =
      injector.get<GetTodoByDateTimeUseCase>();

  void getFirstTodos() async {
    await getWeeklyTodos();
    await getWeeklyTodos(weeksDifference: 1);
    await getWeeklyTodos(weeksDifference: 2);
    if (state.firstTodoDate.weeksDifference < -1) {
      await getWeeklyTodos(weeksDifference: -1);
    }
    if (state.firstTodoDate.weeksDifference < -2) {
      await getWeeklyTodos(weeksDifference: -2);
    }
  }

  void setCurrentPageIndex(int index) {
    emit(state.copyWith(currentPageIndex: index));
  }

  void loadWeekTodos({required int weekIndex, bool refresh = false}) async {
    if (refresh) {
      await getWeeklyTodos(weeksDifference: weekIndex);
      return;
    }
    final weekListIndex = state.weeklyTodos
        .indexWhere((weekTodos) => weekTodos.weekNumber == weekIndex);
    if (weekListIndex == -1) {
      await getWeeklyTodos(weeksDifference: weekIndex);
    }
  }

  Future<void> getWeeklyTodos({int weeksDifference = 0}) async {
    final weekIndex = state.weeklyTodos
        .indexWhere((weekTodos) => weekTodos.weekNumber == weeksDifference);

    if (weekIndex != -1 &&
        state.weeklyTodos[weekIndex].statusState ==
            const TodoListStatusState.loading()) {
      return;
    }

    if (weekIndex == -1) {
      addLoadingWeekTodo(weeksDifference: weeksDifference,);
    } else {
      setLoadingWeekTodo(weekIndex: weekIndex);
    }

    List<DateTime> weekDates = [];

    if (weeksDifference != 0) {
      weekDates = DateTime.now().add(Duration(days: 7 * weeksDifference)).getDatesForWeek;
    } else {
      weekDates = DateTime.now().getDatesForWeek;
    }

    if (weekDates.isEmpty) {
      setErrorWeekTodo(weekIndex: weekIndex);
      return;
    }

    List<DailyTodoList> dailyTodoLists = [];

    for (DateTime day in weekDates) {
      final todos = await _getTodoByDateTimeUseCase(params: day);
      dailyTodoLists.add(DailyTodoList(todos: todos, date: day, statusState: const TodoListStatusState.success()));
    }

    final newWeekIndex = state.weeklyTodos
        .indexWhere((weekTodos) => weekTodos.weekNumber == weeksDifference);

    setSuccessWeekTodo(weekIndex: newWeekIndex, dailyTodoLists: dailyTodoLists);

  }

  void setLoadingWeekTodo({required int weekIndex}) {
    final weekTodo = state.weeklyTodos[weekIndex];
    final newWeekTodo = weekTodo.copyWith(statusState: const TodoListStatusState.loading());
    List<WeeklyTodos> newWeeklyTodos = [...state.weeklyTodos];
    newWeeklyTodos[weekIndex] = newWeekTodo;
    emit(state.copyWith(weeklyTodos: newWeeklyTodos));
  }

  void setErrorWeekTodo({required int weekIndex}) {
    final weekTodo = state.weeklyTodos[weekIndex];
    final newWeekTodo = weekTodo.copyWith(statusState: const TodoListStatusState.failed());
    List<WeeklyTodos> newWeeklyTodos = [...state.weeklyTodos];
    newWeeklyTodos[weekIndex] = newWeekTodo;
    emit(state.copyWith(weeklyTodos: newWeeklyTodos));
  }

  void setSuccessWeekTodo({required int weekIndex, required List<DailyTodoList> dailyTodoLists}) {
    final weekTodo = state.weeklyTodos[weekIndex];
    final newWeekTodo = weekTodo.copyWith(statusState: const TodoListStatusState.success(), weeklyTodos: dailyTodoLists);
    List<WeeklyTodos> newWeeklyTodos = [...state.weeklyTodos];
    newWeeklyTodos[weekIndex] = newWeekTodo;
    emit(state.copyWith(weeklyTodos: newWeeklyTodos));
  }

  void addLoadingWeekTodo({required int weeksDifference,}) {
    if (state.weeklyTodos.isNotEmpty) {
      final lastWeekIndex = state.weeklyTodos.last.weekNumber;
      final firstWeekIndex = state.weeklyTodos.first.weekNumber;
      if (firstWeekIndex > weeksDifference) {
        emit(
          state.copyWith(
            weeklyTodos: [
              WeeklyTodos(
                weeklyTodos: const [],
                weekNumber: weeksDifference,
                statusState: const TodoListStatusState.loading(),
              ), ...state.weeklyTodos,
            ],
          ),
        );
      }

      if (firstWeekIndex < weeksDifference && lastWeekIndex > weeksDifference) {

        final weekIndexPageIsBigger = state.weeklyTodos
            .indexWhere((weekTodos) => weekTodos.weekNumber > weeksDifference);

        List<WeeklyTodos> firstList = state.weeklyTodos.sublist(0, weekIndexPageIsBigger);
        List<WeeklyTodos> secondList = state.weeklyTodos.sublist(weekIndexPageIsBigger);
        emit(
          state.copyWith(
            weeklyTodos: [
              ...firstList,
              WeeklyTodos(
                weeklyTodos: const [],
                weekNumber: weeksDifference,
                statusState: const TodoListStatusState.loading(),
              ),
              ...secondList,
            ],
          ),
        );
      }

      if (lastWeekIndex < weeksDifference) {
        emit(
          state.copyWith(
            weeklyTodos: [
              ...state.weeklyTodos,
              WeeklyTodos(
                weeklyTodos: const [],
                weekNumber: weeksDifference,
                statusState: const TodoListStatusState.loading(),
              ),
            ],
          ),
        );
      }
    }
    if (state.weeklyTodos.isEmpty) {
      emit(
        state.copyWith(
          weeklyTodos: [
            WeeklyTodos(
              weeklyTodos: const [],
              weekNumber: weeksDifference,
              statusState: const TodoListStatusState.loading(),
            )
          ],
        ),
      );
    }
  }
}
