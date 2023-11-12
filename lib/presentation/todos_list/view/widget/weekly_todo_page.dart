import 'package:clean_architecture_todo_app/config/config.dart';
import 'package:clean_architecture_todo_app/presentation/todos_list/cubit/todo_list_cubit.dart';
import 'package:clean_architecture_todo_app/presentation/todos_list/view/widget/todo_card.dart';
import 'package:clean_architecture_todo_app/utils/extension/date_time_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WeeklyTodoPage extends StatelessWidget {
  const WeeklyTodoPage({
    Key? key,
    required this.weeklyTodos,
    required this.firstTodoDate,
  }) : super(key: key);

  final WeeklyTodos weeklyTodos;
  final DateTime? firstTodoDate;

  @override
  Widget build(BuildContext context) {
    if (weeklyTodos.statusState == const TodoListStatusState.loading()) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (weeklyTodos.statusState == const TodoListStatusState.failed()) {
      return const Center(
        child: Text("There was an error fetching todos for this week"),
      );
    }

    if (!weeklyTodos.weeklyTodos
        .any((dailyTodos) => dailyTodos.todos.isNotEmpty)) {
      return Center(
        child: Text(
          "There is no todo for this week",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return ListView.builder(
      itemCount: weeklyTodos.weeklyTodos.length,
      itemBuilder: (context, index) {
        final dailyList = weeklyTodos.weeklyTodos[index];
        if (dailyList.date.compareTo(firstTodoDate ?? DateTime.now()) <= 0) {
          return const SizedBox.shrink();
        }
        if (dailyList.todos.isEmpty) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateTime(dailyList.date.year, dailyList.date.month,
                        dailyList.date.day)
                    .formattedDay.toUpperCase(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dailyList.todos.length,
                itemBuilder: (context, subIndex) {
                  final todo = dailyList.todos[subIndex];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        context
                            .push(RouteConstants.todosDetails.path, extra: todo)
                            .then((value) {
                          if (value == true) {
                            BlocProvider.of<TodoListCubit>(context).loadWeekTodos(
                                weekIndex: weeklyTodos.weekNumber, refresh: true);
                          }
                        });
                      },
                      child: TodoCard(
                        todo: todo,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
