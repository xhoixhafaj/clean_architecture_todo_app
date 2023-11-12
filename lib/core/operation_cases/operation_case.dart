import 'dart:async';

abstract class OperationCase<T, Params> {
  FutureOr<T> call({required Params params});
}