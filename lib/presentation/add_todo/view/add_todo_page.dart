import 'package:clean_architecture_todo_app/config/theme/buttons/buttons.dart';
import 'package:clean_architecture_todo_app/config/theme/text_fields/text_fields.dart';
import 'package:clean_architecture_todo_app/presentation/add_todo/cubit/add_todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddTodoCubit(),
      child: const AddTodoView(),
    );
  }
}

class AddTodoView extends StatelessWidget {
  const AddTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTodoCubit, AddTodoState>(
      listener: (context, state) {
        state.statusState.maybeWhen(
            orElse: () => null,
            success: (date) {
              context.pop(date);
            });
      },
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Add Todo",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    )),
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => context.pop(),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BlocBuilder<AddTodoCubit, AddTodoState>(
                    buildWhen: (previous, current) =>
                        previous.addTodoFields.title !=
                            current.addTodoFields.title ||
                        previous.isSubmittedOnce != current.isSubmittedOnce,
                    builder: (context, state) {
                      return InputTextField(
                        onChanged: (String value) {
                          BlocProvider.of<AddTodoCubit>(context)
                              .titleChanged(value);
                        },
                        labelText: 'Title',
                        errorText: state.isSubmittedOnce &&
                                state.addTodoFields.title.isNotValid
                            ? 'Title cannot be empty'
                            : null,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BlocBuilder<AddTodoCubit, AddTodoState>(
                      buildWhen: (previous, current) =>
                          previous.addTodoFields.untilDate !=
                              current.addTodoFields.untilDate ||
                          previous.isSubmittedOnce != current.isSubmittedOnce,
                      builder: (context, state) {
                        return DateTextField(
                          onChanged: (DateTime value) {
                            BlocProvider.of<AddTodoCubit>(context)
                                .dateChanged(value);
                          },
                          labelText: 'Until Date',
                          firstDate: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BlocBuilder<AddTodoCubit, AddTodoState>(
                    buildWhen: (previous, current) =>
                        previous.addTodoFields.description !=
                            current.addTodoFields.description ||
                        previous.isSubmittedOnce != current.isSubmittedOnce,
                    builder: (context, state) {
                      return MultipleLinesTextField(
                        onChanged: (String value) {
                          BlocProvider.of<AddTodoCubit>(context)
                              .descriptionChanged(value);
                        },
                        labelText: "Description",
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: BlocSelector<AddTodoCubit, AddTodoState,
                  ({bool isLoading, bool hasFailure})>(
                selector: (state) => state.statusState.maybeWhen(
                  orElse: () => (isLoading: false, hasFailure: false),
                  failed: () => (isLoading: false, hasFailure: true),
                  loading: () => (isLoading: true, hasFailure: false),
                ),
                builder: (context, addTodoStatusData) {
                  if (addTodoStatusData.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: [
                      if (addTodoStatusData.hasFailure)
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Failed to add todo',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      PrimaryButton(
                        onPressed: () {
                          BlocProvider.of<AddTodoCubit>(context).addTodo();
                        },
                        text: 'Add Todo',
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
