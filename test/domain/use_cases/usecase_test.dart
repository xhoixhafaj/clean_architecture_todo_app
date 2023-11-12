
import 'delete_todo_usecase_test.dart' as DeleteTest;
import 'get_todo_by_date_usecase_test.dart' as GetTodosTest;
import 'get_earliest_todo_usecase_test.dart' as EarliestTodoTest;
import 'insert_todo_usecase_test.dart' as InsertTodoTest;
import 'update_todo_usecase_test.dart' as UpdateTodoTest;


void main() {
  DeleteTest.main();
  GetTodosTest.main();
  EarliestTodoTest.main();
  InsertTodoTest.main();
  UpdateTodoTest.main();
}