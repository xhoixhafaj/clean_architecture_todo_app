import 'dart:async';

abstract class UseCase<T, Params> {
  FutureOr<T> call({required Params params});
}