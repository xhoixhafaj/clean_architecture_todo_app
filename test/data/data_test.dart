import 'models/models_test.dart' as ModelsTest;
import 'repository_implementation/repository_implementation_test.dart' as RepositoryImplementationTest;
import 'data_sources/local/floor_db/appdatabase_test.dart' as AppDatabaseTest;

void main() {
  ModelsTest.main();
  RepositoryImplementationTest.main();
  AppDatabaseTest.main();
}