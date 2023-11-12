import 'package:clean_architecture_todo_app/core/use_cases/use_case.dart';
import 'package:clean_architecture_todo_app/domain/domain.dart';

class DeleteTodoUseCase implements UseCase<bool, Todo> {

  DeleteTodoUseCase(this._todoRepository);

  final TodoRepository _todoRepository;

  @override
  Future<bool> call({required Todo params}) async {
    final isDeleted = await _todoRepository.deleteTodo(
      params,
    );
    return isDeleted;
  }
}