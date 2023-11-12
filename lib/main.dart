import 'package:clean_architecture_todo_app/config/theme/app_color_scheme.dart';
import 'package:clean_architecture_todo_app/config/theme/theme_service.dart';
import 'package:clean_architecture_todo_app/injector.dart';
import 'package:flutter/material.dart';

import 'config/app.dart';

void main() {
  initializeDependencies();
  runApp(const App());
}

