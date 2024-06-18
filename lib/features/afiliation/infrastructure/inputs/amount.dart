

import 'package:formz/formz.dart';

enum AmountError { format }

class Amount extends FormzInput<double, AmountError>{

  const Amount.pure() : super.pure(0);
  const Amount.dirty(super.value) : super.dirty();

  
  String? get errorMessage{
    if( isValid || isPure ) return null;

    if ( displayError == AmountError.format ) return 'El monto no puede ser menor a 0';

    return null;
  }


  @override
  AmountError? validator(double value) {
    if ( value < 0 ) return AmountError.format;
    return null;
  }

}