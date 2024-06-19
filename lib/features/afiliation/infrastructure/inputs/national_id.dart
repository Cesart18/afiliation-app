
import 'package:formz/formz.dart';

enum NationalIdError { empty }


class NationalId extends FormzInput<int, NationalIdError>{

  const NationalId.pure() : super.pure(0);
  const NationalId.dirty(super.value) : super.dirty();
  
  String? get errorMessage{
    if ( isPure || isValid ) return null;

    if ( displayError == NationalIdError.empty ) return 'Cédula es requerida';

    return null;
  }


  @override
  NationalIdError? validator(int value) {
    if ( value <= 0 ) return NationalIdError.empty;
    return null;
  }

}