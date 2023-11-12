import 'package:clean_architecture_todo_app/core/use_cases/use_case.dart';
import 'package:clean_architecture_todo_app/domain/domain.dart';

class UpdateTodoUseCase implements UseCase<bool, Todo> {

  UpdateTodoUseCase(this._todoRepository);

  final TodoRepository _todoRepository;

  @override
  Future<bool> call({required Todo params}) async {
    return _todoRepository.updateTodo(params);
  }
}