import 'package:formz/formz.dart';

/// Validation error for Email Validation
enum EmptyValidatorError {
  /// validation error
  invalid
}

/// Form input for an email input
class Empty extends FormzInput<String, EmptyValidatorError> {
  const Empty.pure() : super.pure('');

  /// modified email input
  const Empty.dirty([String value = '']) : super.dirty(value);

  @override
  EmptyValidatorError? validator(String value) {
    return value.isNotEmpty
        ? null
        : EmptyValidatorError.invalid;
  }
}
