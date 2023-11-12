import 'package:flutter/foundation.dart' show immutable;

typedef RouteName = String;
typedef RoutePath = String;

@immutable
class RouteConstants {
  const RouteConstants._();

  //Splash
  static RouteConst splash = const RouteConst('splash', '/splash');

  //Todos List
  static RouteConst todosList = const RouteConst('todosList', '/todosList');

  //Add todos
  static RouteConst addTodo = const RouteConst('addTodo', '/addTodo');

  //Todos List
  static RouteConst todosDetails = const RouteConst('todosDetails', '/todosDetails');

}

@immutable
class RouteConst {
  final RouteName name;
  final RoutePath path;

  const RouteConst(this.name, this.path);
}