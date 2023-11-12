import 'package:clean_architecture_todo_app/core/use_cases/use_case.dart';
import 'package:clean_architecture_todo_app/domain/domain.dart';

class GetEarliestTodoByDateUseCase implements UseCase<DateTime?, void> {

  GetEarliestTodoByDateUseCase(this._todoRepository);

  final TodoRepository _todoRepository;

  @override
  Future<DateTime?> call({required void params}) async {
    final earliestTodo = await _todoRepository.getTheEarliestTodo();
    return earliestTodo?.untilDate;
  }
}