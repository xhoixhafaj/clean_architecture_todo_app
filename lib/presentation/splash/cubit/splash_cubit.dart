import 'package:clean_architecture_todo_app/domain/use_cases/get_earliest_todo_date_use_case.dart';
import 'package:clean_architecture_todo_app/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';

part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  final getEarliestTodoByDateUseCase = injector.get<GetEarliestTodoByDateUseCase>();

  Future<void> init() async {
    emit(const SplashState.loading());
    final result = await getEarliestTodoByDateUseCase(params: null);
    await Future.delayed(const Duration(seconds: 2));
    emit(SplashState.success(dateTime: result));
  }

}
