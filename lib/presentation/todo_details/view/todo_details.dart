import 'package:clean_architecture_todo_app/config/config.dart';
import 'package:clean_architecture_todo_app/domain/domain.dart';
import 'package:clean_architecture_todo_app/presentation/todo_details/cubit/todo_details_cubit.dart';
import 'package:clean_architecture_todo_app/utils/extension/date_time_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TodoDetailsPage extends StatelessWidget {
  const TodoDetailsPage({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoDetailsCubit(todo: todo),
      child: const TodoDetailsView(),
    );
  }
}

class TodoDetailsView extends StatelessWidget {
  const TodoDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Details",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => context.pop(
              BlocProvider.of<TodoDetailsCubit>(context).state.isDoneChanged),
        ),
        actions: [
          BlocSelector<TodoDetailsCubit, TodoDetailsState, bool>(
              selector: (state) => state.newIdDoneValue != state.todo.isDone,
              builder: (context, showSave) {
                if (!showSave) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {
                      context.read<TodoDetailsCubit>().saveChanges();
                    },
                    icon: Icon(
                      Icons.save,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                );
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Title: ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    BlocProvider.of<TodoDetailsCubit>(context).state.todo.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              BlocSelector<TodoDetailsCubit, TodoDetailsState, bool>(
                  selector: (state) => state.newIdDoneValue,
                  builder: (context, seekCompletedValue) {
                    return Row(
                      children: [
                        Text(
                          "Todo Status: ",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          seekCompletedValue ? "Done" : "Not Done",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: SizedBox(
                            height: 30,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Switch(
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                activeTrackColor: Theme.of(context)
                                    .extension<CustomColorsExtension>()
                                    ?.lightGrey,
                                inactiveTrackColor: Theme.of(context)
                                    .extension<CustomColorsExtension>()
                                    ?.lightGrey,
                                inactiveThumbColor: Colors.white,
                                value: seekCompletedValue,
                                onChanged: (value) {
                                  BlocProvider.of<TodoDetailsCubit>(context)
                                      .updateTodo();
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Until date: ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    BlocProvider.of<TodoDetailsCubit>(context)
                        .state
                        .todo
                        .untilDate
                        .formattedDay,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Description:",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                BlocProvider.of<TodoDetailsCubit>(context)
                    .state
                    .todo
                    .description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
