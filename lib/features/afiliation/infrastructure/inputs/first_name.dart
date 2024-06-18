
import 'package:formz/formz.dart';

enum FirstNameError { isEmpty }

class FirstName extends FormzInput<String, FirstNameError>{

  const FirstName.pure() : super.pure('');
  const FirstName.dirty(super.value) : super.dirty();

  
  String? get errorMessage{
    if ( isValid || isPure ) return null;

    if ( displayError == FirstNameError.isEmpty ) return 'Nombre es requerido';

    return null;
  }

  @override
  FirstNameError? validator(String value) {
    if( value.isEmpty || value.trim().isEmpty ) return FirstNameError.isEmpty;
    return null;
  }

}