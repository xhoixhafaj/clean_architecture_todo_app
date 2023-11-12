import 'package:clean_architecture_todo_app/presentation/todos_list/cubit/todo_list_cubit.dart';
import 'package:clean_architecture_todo_app/utils/extension/date_time_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageNavigator extends StatelessWidget {
  const PageNavigator(this._pageController, {Key? key, required this.initialPage,}) : super(key: key);

  final int initialPage;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocSelector<TodoListCubit, TodoListState, bool>(
            selector: (state) => state.currentPageIndex != 0,
            builder: (context, canGoBack) {
              return TextButton(
                onPressed: canGoBack ? () {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                } : null,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(Icons.arrow_back_ios_new),
                ),
              );
            }
        ),
        Expanded(
          child: Center(
            child: BlocSelector<TodoListCubit, TodoListState, String>(
                selector: (state) {
                  final weekNumber = state.currentPageIndex - initialPage;
                  if (state.weeklyTodos.any((week) => week.weekNumber == weekNumber)) {
                    final date = DateTime.now().add(Duration(days: 7 * weekNumber));
                    return date.formattedWeek;
                  } else {
                    return "";
                  }
                },
                builder: (context, title) {
                  return Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  );
                }
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ],
    );
  }
}
