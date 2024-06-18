import 'package:afiliados_app/features/afiliation/infrastructure/infrastructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final userFormInputProvider = StateNotifierProvider.autoDispose<UserFormInputNotifier,UserFormInputState>((ref) {
  return UserFormInputNotifier();
});

class UserFormInputNotifier extends StateNotifier<UserFormInputState> {
  UserFormInputNotifier(): super(UserFormInputState());

  void onFirstNameChanged( String value ){
    final newFirstName = FirstName.dirty(value);
    state = state.copyWith(
      firstName: newFirstName,
      isValid: Formz.validate([ newFirstName, state.lastName, state.amount ])
    );
  }
  void onLastNameChanged( String value ){
    final newLastName = LastName.dirty(value);
    state = state.copyWith(
      lastName: newLastName,
      isValid: Formz.validate([ newLastName, state.firstName, state.amount ])
    );
  }
  void onAmountChanged( String value ){
    final newAmount = Amount.dirty(double.parse(value));
    state = state.copyWith(
      amount: newAmount,
      isValid: Formz.validate([ newAmount, state.firstName, state.lastName ])
    );
  }
  void onTypeUserChanged( bool? value ){
    state = state.copyWith(
      isDoctor: value
    );
  // TODO: hacer la consideracion del valor inicial a traves del widget
  }

  // TODO: OnformSubmit

  _touchedEveryField(){
    final firstName = FirstName.dirty(state.firstName.value);
    final lastName = LastName.dirty(state.lastName.value);
    final amount = Amount.dirty(state.amount.value);

    state = state.copyWith(
      firstName: firstName,
      lastName: lastName,
      amount: amount,
      isFormPosted: true,
      isValid: Formz.validate([ firstName, lastName, amount ])
    );
  }

}



// ! la logica que puedo implementar para usuario existente es que al abrirlo los value de los inputs sean sus valores

class UserFormInputState {
  final FirstName firstName;
  final LastName lastName;
  final Amount amount;
  final bool isDoctor;
  final bool isValid;
  final bool isFormPosted;
  final bool isPosting;

  UserFormInputState({
      this.firstName = const FirstName.pure(),
      this.lastName = const LastName.pure(),
      this.amount = const Amount.pure(),
      this.isDoctor = false,
      this.isValid = false,
      this.isFormPosted = false,
      this.isPosting = false
      });

  UserFormInputState copyWith({
    FirstName? firstName,
    LastName? lastName,
    Amount? amount,
    bool? isDoctor,
    bool? isValid,
    bool? isFormPosted,
    bool? isPosting,
  }) =>
      UserFormInputState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        amount: amount ?? this.amount,
        isDoctor: isDoctor ?? this.isDoctor,
        isValid: isValid ?? this.isValid,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isPosting: isPosting ?? this.isPosting,
      );
}
