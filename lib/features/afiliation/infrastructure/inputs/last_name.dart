
import 'package:formz/formz.dart';

enum LastNameError { isEmpty }

class LastName extends FormzInput<String, LastNameError>{

  const LastName.pure() : super.pure('');
  const LastName.dirty(super.value) : super.dirty();

  
  String? get errorMessage{
    if ( isValid || isPure ) return null;

    if ( displayError == LastNameError.isEmpty ) return 'El campo apellido no puede estar vacio';

    return null;
  }

  @override
  LastNameError? validator(String value) {
    if( value.isEmpty || value.trim().isEmpty ) return LastNameError.isEmpty;
    return null;
  }

}