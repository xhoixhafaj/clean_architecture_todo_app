// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_todo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddTodoState {
  AddTodoFields get addTodoFields => throw _privateConstructorUsedError;
  AddTodoStatusState get statusState => throw _privateConstructorUsedError;
  bool get isSubmittedOnce => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddTodoStateCopyWith<AddTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTodoStateCopyWith<$Res> {
  factory $AddTodoStateCopyWith(
          AddTodoState value, $Res Function(AddTodoState) then) =
      _$AddTodoStateCopyWithImpl<$Res, AddTodoState>;
  @useResult
  $Res call(
      {AddTodoFields addTodoFields,
      AddTodoStatusState statusState,
      bool isSubmittedOnce});

  $AddTodoStatusStateCopyWith<$Res> get statusState;
}

/// @nodoc
class _$AddTodoStateCopyWithImpl<$Res, $Val extends AddTodoState>
    implements $AddTodoStateCopyWith<$Res> {
  _$AddTodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addTodoFields = null,
    Object? statusState = null,
    Object? isSubmittedOnce = null,
  }) {
    return _then(_value.copyWith(
      addTodoFields: null == addTodoFields
          ? _value.addTodoFields
          : addTodoFields // ignore: cast_nullable_to_non_nullable
              as AddTodoFields,
      statusState: null == statusState
          ? _value.statusState
          : statusState // ignore: cast_nullable_to_non_nullable
              as AddTodoStatusState,
      isSubmittedOnce: null == isSubmittedOnce
          ? _value.isSubmittedOnce
          : isSubmittedOnce // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddTodoStatusStateCopyWith<$Res> get statusState {
    return $AddTodoStatusStateCopyWith<$Res>(_value.statusState, (value) {
      return _then(_value.copyWith(statusState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddTodoStateImplCopyWith<$Res>
    implements $AddTodoStateCopyWith<$Res> {
  factory _$$AddTodoStateImplCopyWith(
          _$AddTodoStateImpl value, $Res Function(_$AddTodoStateImpl) then) =
      __$$AddTodoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AddTodoFields addTodoFields,
      AddTodoStatusState statusState,
      bool isSubmittedOnce});

  @override
  $AddTodoStatusStateCopyWith<$Res> get statusState;
}

/// @nodoc
class __$$AddTodoStateImplCopyWithImpl<$Res>
    extends _$AddTodoStateCopyWithImpl<$Res, _$AddTodoStateImpl>
    implements _$$AddTodoStateImplCopyWith<$Res> {
  __$$AddTodoStateImplCopyWithImpl(
      _$AddTodoStateImpl _value, $Res Function(_$AddTodoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addTodoFields = null,
    Object? statusState = null,
    Object? isSubmittedOnce = null,
  }) {
    return _then(_$AddTodoStateImpl(
      addTodoFields: null == addTodoFields
          ? _value.addTodoFields
          : addTodoFields // ignore: cast_nullable_to_non_nullable
              as AddTodoFields,
      statusState: null == statusState
          ? _value.statusState
          : statusState // ignore: cast_nullable_to_non_nullable
              as AddTodoStatusState,
      isSubmittedOnce: null == isSubmittedOnce
          ? _value.isSubmittedOnce
          : isSubmittedOnce // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddTodoStateImpl implements _AddTodoState {
  const _$AddTodoStateImpl(
      {this.addTodoFields = const AddTodoFields(),
      this.statusState = const AddTodoStatusState.initial(),
      this.isSubmittedOnce = false});

  @override
  @JsonKey()
  final AddTodoFields addTodoFields;
  @override
  @JsonKey()
  final AddTodoStatusState statusState;
  @override
  @JsonKey()
  final bool isSubmittedOnce;

  @override
  String toString() {
    return 'AddTodoState(addTodoFields: $addTodoFields, statusState: $statusState, isSubmittedOnce: $isSubmittedOnce)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTodoStateImpl &&
            (identical(other.addTodoFields, addTodoFields) ||
                other.addTodoFields == addTodoFields) &&
            (identical(other.statusState, statusState) ||
                other.statusState == statusState) &&
            (identical(other.isSubmittedOnce, isSubmittedOnce) ||
                other.isSubmittedOnce == isSubmittedOnce));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, addTodoFields, statusState, isSubmittedOnce);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTodoStateImplCopyWith<_$AddTodoStateImpl> get copyWith =>
      __$$AddTodoStateImplCopyWithImpl<_$AddTodoStateImpl>(this, _$identity);
}

abstract class _AddTodoState implements AddTodoState {
  const factory _AddTodoState(
      {final AddTodoFields addTodoFields,
      final AddTodoStatusState statusState,
      final bool isSubmittedOnce}) = _$AddTodoStateImpl;

  @override
  AddTodoFields get addTodoFields;
  @override
  AddTodoStatusState get statusState;
  @override
  bool get isSubmittedOnce;
  @override
  @JsonKey(ignore: true)
  _$$AddTodoStateImplCopyWith<_$AddTodoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddTodoStatusState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failed,
    required TResult Function(DateTime? dateTime) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? failed,
    TResult? Function(DateTime? dateTime)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failed,
    TResult Function(DateTime? dateTime)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTodoStatusStateCopyWith<$Res> {
  factory $AddTodoStatusStateCopyWith(
          AddTodoStatusState value, $Res Function(AddTodoStatusState) then) =
      _$AddTodoStatusStateCopyWithImpl<$Res, AddTodoStatusState>;
}

/// @nodoc
class _$AddTodoStatusStateCopyWithImpl<$Res, $Val extends AddTodoStatusState>
    implements $AddTodoStatusStateCopyWith<$Res> {
  _$AddTodoStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AddTodoStatusStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AddTodoStatusState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failed,
    required TResult Function(DateTime? dateTime) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? failed,
    TResult? Function(DateTime? dateTime)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failed,
    TResult Function(DateTime? dateTime)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddTodoStatusState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AddTodoStatusStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AddTodoStatusState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failed,
    required TResult Function(DateTime? dateTime) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? failed,
    TResult? Function(DateTime? dateTime)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failed,
    TResult Function(DateTime? dateTime)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AddTodoStatusState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$AddTodoStatusStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl();

  @override
  String toString() {
    return 'AddTodoStatusState.failed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failed,
    required TResult Function(DateTime? dateTime) success,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? failed,
    TResult? Function(DateTime? dateTime)? success,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failed,
    TResult Function(DateTime? dateTime)? success,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Success value) success,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Success value)? success,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements AddTodoStatusState {
  const factory _Failed() = _$FailedImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? dateTime});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$AddTodoStatusStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_$SuccessImpl(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({this.dateTime = null});

  @override
  @JsonKey()
  final DateTime? dateTime;

  @override
  String toString() {
    return 'AddTodoStatusState.success(dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failed,
    required TResult Function(DateTime? dateTime) success,
  }) {
    return success(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? failed,
    TResult? Function(DateTime? dateTime)? success,
  }) {
    return success?.call(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failed,
    TResult Function(DateTime? dateTime)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements AddTodoStatusState {
  const factory _Success({final DateTime? dateTime}) = _$SuccessImpl;

  DateTime? get dateTime;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
