import 'package:formz/formz.dart';

class EmailInput extends FormzInput<String, String> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    return !value.contains('@') ? 'Informe um email válido' : null;
  }
}
