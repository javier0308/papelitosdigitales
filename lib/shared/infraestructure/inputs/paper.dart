import 'package:formz/formz.dart';

// Define input validation errors
enum PaperError { empty, lenght, maxlenght }

// Extend FormzInput and provide the input type and error type.
class Paper extends FormzInput<String, PaperError> {
  // Call super.pure to represent an unmodified form input.
  const Paper.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Paper.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PaperError.empty) return 'El campo es requerido';
    if (displayError == PaperError.lenght) return 'campo obligatorio';
    if (displayError == PaperError.maxlenght) {
      return 'Maximo de caracteres permitidos';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PaperError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PaperError.empty;
    if (value.isEmpty) return PaperError.lenght;
    if (value.length > 15) return PaperError.maxlenght;

    return null;
  }
}
