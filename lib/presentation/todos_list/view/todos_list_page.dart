import 'package:clean_architecture_todo_app/config/config.dart';
import 'package:clean_architecture_todo_app/presentation/todos_list/cubit/todo_list_cubit.dart';
import 'package:clean_architecture_todo_app/presentation/todos_list/view/widget/widget.dart';
import 'package:clean_architecture_todo_app/utils/extension/date_time_extension.dart';
import 'package:clean_architecture_todo_app/utils/extension/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TodosListPage extends StatelessWidget {
  const TodosListPage({Key? key, this.lastTodoDate}) : super(key: key);

  final DateTime? lastTodoDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
          TodoListCubit(firstTodoDate: lastTodoDate)..getFirstTodos(),
      child: const TodosListView(),
    );
  }
}

class TodosListView extends StatefulWidget {
  const TodosListView({Key? key}) : super(key: key);

  @override
  State<TodosListView> createState() => _TodosListViewState();
}

class _TodosListViewState extends State<TodosListView> {
  late PageController _pageController;

  late int initialPage;

  @override
  void initState() {
    initialPage = BlocProvider.of<TodoListCubit>(context)
            .firstTodoDate
            .weeksDifference
            .abs();
    _pageController = PageController(
      initialPage: initialPage,
    );
    BlocProvider.of<TodoListCubit>(context).setCurrentPageIndex(initialPage);
    _pageController.addListener(() {
      final _currentPage = _pageController.page ?? initialPage.toDouble();
      if (_currentPage.isInteger) {
        BlocProvider.of<TodoListCubit>(context)
            .setCurrentPageIndex(_currentPage.toInt());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todos",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  )),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            PageNavigator(_pageController, initialPage: initialPage),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (pageIndex) {
                  BlocProvider.of<TodoListCubit>(context)
                      .loadWeekTodos(weekIndex: pageIndex - initialPage);
                },
                itemBuilder: (context, pageIndex) {
                  return BlocSelector<TodoListCubit, TodoListState,
                      WeeklyTodos?>(selector: (state) {
                    final weeklyTodoIndex =
                        BlocProvider.of<TodoListCubit>(context)
                            .state
                            .weeklyTodos
                            .indexWhere((weekTodo) =>
                                weekTodo.weekNumber == pageIndex - initialPage);
                    if (weeklyTodoIndex == -1) {
                      return null;
                    }
                    return BlocProvider.of<TodoListCubit>(context)
                        .state
                        .weeklyTodos[weeklyTodoIndex];
                  }, builder: (context, weeklyTodos) {
                    if (weeklyTodos == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return WeeklyTodoPage(
                      weeklyTodos: weeklyTodos,
                      firstTodoDate: BlocProvider.of<TodoListCubit>(context)
                          .state.firstTodoDate,
                    );
                  });
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(RouteConstants.addTodo.path).then((value) {
              if (value is DateTime) {
                BlocProvider.of<TodoListCubit>(context)
                    .loadWeekTodos(weekIndex: value.weeksDifference, refresh: true);
              }
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}
