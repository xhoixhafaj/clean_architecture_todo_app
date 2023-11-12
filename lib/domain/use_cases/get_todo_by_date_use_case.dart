import 'package:clean_architecture_todo_app/core/use_cases/use_case.dart';
import 'package:clean_architecture_todo_app/domain/domain.dart';

class GetTodoByDateTimeUseCase implements UseCase<List<Todo>, DateTime> {

  GetTodoByDateTimeUseCase(this._todoRepository);

  final TodoRepository _todoRepository;

  @override
  Future<List<Todo>> call({required DateTime params}) async {
    return _todoRepository.getTodosByDateTime(DateTime(params.year, params.month, params.day));
  }
}