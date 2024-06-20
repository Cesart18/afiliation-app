import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:afiliados_app/features/afiliation/infrastructure/infrastructure.dart';
import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:formz/formz.dart';

final newUserHistorialProvider = StateNotifierProvider.family<NewUserHistorialNotifier,NewUserHistorialState, User?>((ref, user) {
  final userNotifier = ref.watch(usersProvider.notifier);
  return NewUserHistorialNotifier(user: user, userNotifier: userNotifier);
});

class NewUserHistorialNotifier extends StateNotifier<NewUserHistorialState> {
  final User? user;
  final UsersNotifier userNotifier;
  NewUserHistorialNotifier({ required this.user, required this.userNotifier })
      : super(NewUserHistorialState(
        firstNameController: TextEditingController(text: Formatters.firstLetterToUpper(user?.firstName ?? 'No hay')),
        lastNameController: TextEditingController(text: Formatters.firstLetterToUpper(user?.lastName ?? 'No hay')),
        nationalIdController: TextEditingController(text: user?.nationalId.toString()),
        amountController: TextEditingController(),
        billNumberController: TextEditingController(),
      )){
        _initValues();
      }

      void onFirstNameChanged(String value) {
    final newFirstName = FirstName.dirty(value);
    state = state.copyWith(
        firstName: newFirstName,
        isValid: Formz.validate(
            [newFirstName, state.lastName, state.amount, state.nationalId, state.billNumber]));
  }

  void onLastNameChanged(String value) {
    final newLastName = LastName.dirty(value);
    state = state.copyWith(
        lastName: newLastName,
        isValid: Formz.validate(
            [newLastName, state.firstName, state.amount, state.nationalId, state.billNumber]));
  }

  void onNationalIdChanged(int value) {
    final newNationalId = NationalId.dirty(value);
    state = state.copyWith(
        nationalId: newNationalId,
        isValid: Formz.validate(
            [newNationalId, state.firstName, state.amount, state.lastName, state.billNumber]));
  }

  void onAmountChanged(double value) {
    final newAmount = Amount.dirty(value);
    state = state.copyWith(
        amount: newAmount,
        isValid: Formz.validate(
            [newAmount, state.firstName, state.lastName, state.nationalId, state.billNumber]));
  }
  void onBillNumberChanged(int value) {
    final newBillNumber = BillNumber.dirty(value);
    state = state.copyWith(
        billNumber: newBillNumber,
        isValid: Formz.validate(
            [newBillNumber, state.firstName, state.lastName, state.nationalId, state.amount]));
  }

  void onTypeUserChanged(bool? value) {
    state = state.copyWith(isDoctor: value);
  }

    void onFormsumbit() async {
    _touchedEveryField();

    state = state.copyWith(isPosting: true);
    if( !state.editing ){
    if (state.amount.isNotValid || state.billNumber.isNotValid) return;
        final newHistorial = UserHistorial()..amount = state.amount.value..date = DateTime.now()..billNumber = '${state.billNumber.value}';
      await userNotifier.addNewHistorial(user?.id ?? 0, newHistorial);
      clearAmount();
      clearBillNumber();
    }

    if( state.firstName.isNotValid && state.lastName.isNotValid && state.nationalId.isNotValid ) return;

    final updatedUser = user
    ?..firstName = state.firstName.value.trim().toLowerCase()
    ..lastName = state.lastName.value.trim().toLowerCase()
    ..nationalId = '${state.nationalId.value}'
    ..isDoctor = state.isDoctor;

    await userNotifier.updateUser(updatedUser ?? User());

    state = state.copyWith(isPosting: false, editing: false);

  }

    _touchedEveryField() {
    final firstName = FirstName.dirty(state.firstName.value);
    final lastName = LastName.dirty(state.lastName.value);
    final nationalId = NationalId.dirty(state.nationalId.value);
    final amount = Amount.dirty(state.amount.value);
    final billNumber = BillNumber.dirty(state.billNumber.value);

    state = state.copyWith(
        firstName: firstName,
        lastName: lastName,
        nationalId: nationalId,
        amount: amount,
        billNumber: billNumber,
        isFormPosted: true,
        isValid: Formz.validate([firstName, lastName, amount, nationalId, billNumber]));
  }

    toggleEdit(){
      state = state.copyWith(
        editing: !state.editing,
      );
    }

    clearFistName() {
    state = state.copyWith(firstName: const FirstName.pure());
    state.firstNameController.clear();
  }

  clearLastName() {
    state = state.copyWith(lastName: const LastName.pure());
    state.lastNameController.clear();
  }

  clearNationalId() {
    state = state.copyWith(nationalId: const NationalId.pure());
    state.nationalIdController.clear();
  }

  clearAmount() {
    state = state.copyWith(amount: const Amount.pure());
    state.amountController.clear();
  }
  clearBillNumber() {
    state = state.copyWith(billNumber: const BillNumber.pure());
    state.billNumberController.clear();
  }
  
    _initValues(){
      state = state.copyWith(
        firstName: FirstName.dirty(Formatters.firstLetterToUpper(user?.firstName ?? 'No hay')),
        lastName: LastName.dirty(Formatters.firstLetterToUpper(user?.lastName ?? 'No hay')),
        nationalId: NationalId.dirty(int.tryParse(user?.nationalId ?? '0') ?? 0),
      );
    }

}

class NewUserHistorialState {
  final FirstName firstName;
  final LastName lastName;
  final NationalId nationalId;
  final Amount amount;
  final BillNumber billNumber;
  final bool isDoctor;
  final bool isValid;
  final bool isFormPosted;
  final bool isPosting;
  final bool editing;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController nationalIdController;
  final TextEditingController amountController;
  final TextEditingController billNumberController;

  NewUserHistorialState({
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.nationalId = const NationalId.pure(),
    this.amount = const Amount.pure(),
    this.billNumber = const BillNumber.pure(),
    this.isDoctor = false,
    this.isValid = false,
    this.isFormPosted = false,
    this.isPosting = false,
    this.editing = false,
    required this.firstNameController,
    required this.lastNameController,
    required this.nationalIdController,
    required this.amountController,
    required this.billNumberController,
  });

  NewUserHistorialState copyWith({
    FirstName? firstName,
    LastName? lastName,
    NationalId? nationalId,
    Amount? amount,
    BillNumber? billNumber,
    bool? isDoctor,
    bool? isValid,
    bool? isFormPosted,
    bool? isPosting,
    bool? editing,
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? nationalIdController,
    TextEditingController? amountController,
    TextEditingController? billNumberController,
  }) =>
      NewUserHistorialState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nationalId: nationalId ?? this.nationalId,
        amount: amount ?? this.amount,
        billNumber: billNumber ?? this.billNumber,
        isDoctor: isDoctor ?? this.isDoctor,
        isValid: isValid ?? this.isValid,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isPosting: isPosting ?? this.isPosting,
        editing: editing ?? this.editing,
        firstNameController: firstNameController ?? this.firstNameController,
        lastNameController: lastNameController ?? this.lastNameController,
        nationalIdController: nationalIdController ?? this.nationalIdController,
        amountController: amountController ?? this.amountController,
        billNumberController: billNumberController ?? this.billNumberController,
      );
}
