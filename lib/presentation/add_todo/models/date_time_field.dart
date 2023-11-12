import 'package:formz/formz.dart';

/// Validation error for username
enum DateTimeValidatorError {
  /// validator error
  invalid
}

/// Form input for username input
class DateTimeField
    extends FormzInput<DateTime?, DateTimeValidatorError> {
  const DateTimeField.pure()
      : super.pure(null);

  /// modified password input
  const DateTimeField.dirty([DateTime? dateTime])
      : super.dirty(dateTime);

  @override
  DateTimeValidatorError? validator(DateTime? value) {
    return value != null
        ? null
        : DateTimeValidatorError.invalid;
  }
}
