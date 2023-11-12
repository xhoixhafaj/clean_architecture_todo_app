import 'package:bloc/bloc.dart';
import 'package:clean_architecture_todo_app/domain/domain.dart';
import 'package:clean_architecture_todo_app/domain/use_cases/insert_todo_use_case.dart';
import 'package:clean_architecture_todo_app/injector.dart';
import 'package:clean_architecture_todo_app/presentation/add_todo/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_todo_state.dart';

part 'add_todo_cubit.freezed.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  AddTodoCubit() : super(const AddTodoState());

  InsertTodoUseCase insertTodoUseCase = injector.get<InsertTodoUseCase>();

  void titleChanged(String value) {
    final title = Title.dirty(value);
    emit(state.copyWith(
      addTodoFields: state.addTodoFields.copyWith(
        title: title,
      ),
    ));
  }

  void descriptionChanged(String value) {
    emit(
      state.copyWith(
        addTodoFields: state.addTodoFields.copyWith(
          description: value,
        ),
      ),
    );
  }

  void dateChanged(DateTime value) {
    emit(
      state.copyWith(
        addTodoFields: state.addTodoFields.copyWith(
          untilDate: DateTimeField.dirty(value),
        ),
      ),
    );
  }

  void addTodo() async {
    if (state.statusState is _Loading) {
      return;
    }
    emit(
      state.copyWith(
        statusState: const AddTodoStatusState.loading(),
        isSubmittedOnce: true,
      ),
    );
    if (state.addTodoFields.isNotValid) {
      emit(
        state.copyWith(
          statusState: const AddTodoStatusState.initial(),
        ),
      );
      return;
    }

    final untilDate = DateTime(
      state.addTodoFields.untilDate.value!.year,
      state.addTodoFields.untilDate.value!.month,
      state.addTodoFields.untilDate.value!.day,
    );

    final todo = Todo(
      title: state.addTodoFields.title.value,
      description: state.addTodoFields.description,
      isDone: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      untilDate: untilDate,
    );

    final response = await insertTodoUseCase.call(params: todo);

    if (!response) {
      emit(
        state.copyWith(
          statusState: const AddTodoStatusState.failed(),
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        statusState: AddTodoStatusState.success(dateTime: untilDate),
      ),
    );
  }
}
