import 'package:clean_architecture_todo_app/domain/domain.dart';
import 'package:clean_architecture_todo_app/domain/use_cases/update_todo_use_case.dart';
import 'package:clean_architecture_todo_app/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_details_state.dart';

part 'todo_details_cubit.freezed.dart';

class TodoDetailsCubit extends Cubit<TodoDetailsState> {
  TodoDetailsCubit({required this.todo})
      : super(TodoDetailsState(
          todo: todo,
          newIdDoneValue: todo.isDone,
        ));

  final UpdateTodoUseCase _updateTodoUseCase = injector.get<UpdateTodoUseCase>();

  final Todo todo;

  void updateTodo() {
    emit(
      state.copyWith(
        newIdDoneValue: !state.newIdDoneValue,
      ),
    );
  }

  void saveChanges() async {
    if (state.statusState is _Loading) {
      return;
    }
    emit(state.copyWith(statusState: const TodoDetailsStatusState.loading()));
    final updatedTodo = state.todo.copyWith(isDone: state.newIdDoneValue);

    final result = await _updateTodoUseCase.call(params: updatedTodo);

    if (!result) {
      emit(state.copyWith(statusState: const TodoDetailsStatusState.failed()));
      return;
    }
    emit(
      state.copyWith(
        todo: updatedTodo,
        newIdDoneValue: updatedTodo.isDone,
        isDoneChanged: true,
        statusState: const TodoDetailsStatusState.initial(),
      ),
    );
  }
}
