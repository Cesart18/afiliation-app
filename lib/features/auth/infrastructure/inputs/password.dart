import 'package:formz/formz.dart';

enum PasswordError { empty, length }

class Password extends FormzInput<String, PasswordError>{

  const Password.pure() : super.pure('');
  const Password.dirty(super.value) : super.dirty();
  
  String? get errorMessage {
    
    if ( isPure || isValid ) return null;

    if ( displayError == PasswordError.empty ) return 'Contraseña es requerida';
    if ( displayError == PasswordError.length ) return 'Contraseña debe ser mayor a 5 caracteres';

    return null;
  }


  @override
  PasswordError? validator(String value) {
    if ( value.isEmpty || value.trim().isEmpty ) return PasswordError.empty;
    if ( value.length < 6 ) return PasswordError.length;
    return null;
  }

}