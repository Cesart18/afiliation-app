
import 'package:formz/formz.dart';

enum BillNumberError { empty }


class BillNumber extends FormzInput<int, BillNumberError>{

  const BillNumber.pure() : super.pure(0);
  const BillNumber.dirty(super.value) : super.dirty();
  
  String? get errorMessage{
    if ( isPure || isValid ) return null;

    if ( displayError == BillNumberError.empty ) return 'Factura es requerida';

    return null;
  }


  @override
  BillNumberError? validator(int value) {
    if ( value <= 0 ) return BillNumberError.empty;
    return null;
  }

}