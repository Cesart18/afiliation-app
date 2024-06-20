

import 'package:formz/formz.dart';

enum AmountError { empty, minValue }

class Amount extends FormzInput<double, AmountError>{

  const Amount.pure() : super.pure(0);
  const Amount.dirty(super.value) : super.dirty();

  
  String? get errorMessage{
    if( isValid || isPure ) return null;

    if ( displayError == AmountError.empty ) return 'Monto es requerido';
    if ( displayError == AmountError.minValue ) return 'Monto minimo 5\$';

    return null;
  }


  @override
  AmountError? validator(double value) {
    if ( value <= 0 ) return AmountError.empty;
    if ( value < 5 ) return AmountError.minValue;
    return null;
  }

}