import 'package:clean_architecture_todo_app/config/config.dart';
import 'package:clean_architecture_todo_app/presentation/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..init(),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        print(state);
        state.maybeWhen(
          success: (dateTime) => context
              .pushReplacement(RouteConstants.todosList.path, extra: dateTime),
          orElse: () => null,
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: Text(
            "Todos".toUpperCase(),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ).animate().fadeIn(
            delay: const Duration(milliseconds: 600),
            duration: const Duration(milliseconds: 400),
          ),
        ),
      ),
    );
  }
}
