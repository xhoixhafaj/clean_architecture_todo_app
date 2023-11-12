part of 'todo_details_cubit.dart';


@freezed
class TodoDetailsState with _$TodoDetailsState {
  const factory TodoDetailsState({
    required Todo todo,
    required bool newIdDoneValue,
    @Default(false) bool isDoneChanged,
    @Default(TodoDetailsStatusState.initial()) TodoDetailsStatusState statusState,
  }) = _TodoDetailsState;
}

@freezed
class TodoDetailsStatusState with _$TodoDetailsStatusState {
  const factory TodoDetailsStatusState.initial() = _Initial;

  const factory TodoDetailsStatusState.loading() = _Loading;

  const factory TodoDetailsStatusState.failed() = _Failed;

}
