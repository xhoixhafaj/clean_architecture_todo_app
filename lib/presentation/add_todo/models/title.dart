import 'package:formz/formz.dart';

/// Validation error for title
enum TitleValidatorError {
  /// validator error
  invalid
}

/// Form input for title input
class Title extends FormzInput<String, TitleValidatorError> {

  const Title.pure() : super.pure('');

  /// modified title input
  const Title.dirty([String value = '']) : super.dirty(value);

  static final _titleRegExp = RegExp(
    '.{3,}',
  );

  @override
  TitleValidatorError? validator(String? value) {
    return _titleRegExp.hasMatch(value ?? '')
        ? null
        : TitleValidatorError.invalid;
  }
}
