import 'package:clean_architecture_todo_app/config/router/route_constants.dart';
import 'package:clean_architecture_todo_app/presentation/add_todo/add_todo.dart';
import 'package:clean_architecture_todo_app/presentation/splash/view/splash_page.dart';
import 'package:clean_architecture_todo_app/presentation/todo_details/view/todo_details.dart';
import 'package:clean_architecture_todo_app/presentation/todos_list/view/todos_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../domain/domain.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: RouteConstants.splash.path,
    routes: [
      GoRoute(
        name: RouteConstants.splash.name,
        path: RouteConstants.splash.path,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: RouteConstants.todosList.name,
        path: RouteConstants.todosList.path,
        builder: (context, state) => TodosListPage(
          lastTodoDate: state.extra as DateTime?,
        ),
      ),
      GoRoute(
        name: RouteConstants.addTodo.name,
        path: RouteConstants.addTodo.path,
        builder: (context, state) => const AddTodoPage(),
      ),
      GoRoute(
        name: RouteConstants.todosDetails.name,
        path: RouteConstants.todosDetails.path,
        builder: (context, state) => TodoDetailsPage(
          todo: state.extra as Todo,
        ),
      ),
    ],
  );
}
