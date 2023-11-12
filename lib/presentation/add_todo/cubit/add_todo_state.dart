part of 'add_todo_cubit.dart';

@freezed
class AddTodoState with _$AddTodoState {
  const factory AddTodoState({
    @Default(AddTodoFields()) AddTodoFields addTodoFields,
    @Default(AddTodoStatusState.initial()) AddTodoStatusState statusState,
    @Default(false) bool isSubmittedOnce,
  }) = _AddTodoState;
}

class AddTodoFields extends Equatable with FormzMixin {
  const AddTodoFields({
    this.title = const Title.pure(),
    this.untilDate = const DateTimeField.pure(),
    this.description = '',
  });

  final Title title;
  final String description;
  final DateTimeField untilDate;

  AddTodoFields copyWith({
    Title? title,
    String? description,
    DateTimeField? untilDate,
  }) {
    return AddTodoFields(
      title: title ?? this.title,
      description: description ?? this.description,
      untilDate: untilDate ?? this.untilDate,
    );
  }

  @override
  List<FormzInput> get inputs => [
    title,
    untilDate,
  ];

  @override
  List<Object?> get props => [
    title,
    description,
    untilDate,
  ];
}


@freezed
class AddTodoStatusState with _$AddTodoStatusState {
  const factory AddTodoStatusState.initial() = _Initial;

  const factory AddTodoStatusState.loading() = _Loading;

  const factory AddTodoStatusState.failed() = _Failed;

  const factory AddTodoStatusState.success({@Default(null) DateTime? dateTime}) = _Success;
}
