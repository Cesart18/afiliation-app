import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:afiliados_app/features/afiliation/infrastructure/infrastructure.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';

final userFormInputProvider = StateNotifierProvider<
    UserFormInputNotifier, UserFormInputState>((ref) {
  final userNotifier = ref.watch(usersProvider.notifier);
  return UserFormInputNotifier(userNotifier: userNotifier);
});

class UserFormInputNotifier extends StateNotifier<UserFormInputState> {
  final UsersNotifier userNotifier;
  UserFormInputNotifier({required this.userNotifier})
      : super(UserFormInputState(
            firstNameController: TextEditingController(),
            lastNameController: TextEditingController(),
            nationalIdController: TextEditingController(),
            amountController: TextEditingController(),
            billNumberController: TextEditingController()
            ));

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
    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);
    await userNotifier.createNewUser(
        firstName: state.firstName.value.trim().toLowerCase(),
        lastName: state.lastName.value.trim().toLowerCase(),
        nationalId: state.nationalId.value,
        amount: state.amount.value,
        isDoctor: state.isDoctor,
        billNumber: state.billNumber.value,
        callback: () => disposeAll()
        );
    state = state.copyWith(isPosting: false);
    

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

  void disposeAll() {
    state = state.copyWith(
        isDoctor: false, isValid: false, isFormPosted: false, isPosting: false);
    clearControllers();
  }

  clearControllers() {
    clearFistName();
    clearLastName();
    clearNationalId();
    clearAmount();
    clearBillNumber();
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
}


class UserFormInputState {
  final FirstName firstName;
  final LastName lastName;
  final NationalId nationalId;
  final Amount amount;
  final BillNumber billNumber;
  final bool isDoctor;
  final bool isValid;
  final bool isFormPosted;
  final bool isPosting;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController nationalIdController;
  final TextEditingController amountController;
  final TextEditingController billNumberController;

  UserFormInputState({
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.nationalId = const NationalId.pure(),
    this.amount = const Amount.pure(),
    this.billNumber = const BillNumber.pure(),
    this.isDoctor = false,
    this.isValid = false,
    this.isFormPosted = false,
    this.isPosting = false,
    required this.firstNameController,
    required this.lastNameController,
    required this.nationalIdController,
    required this.amountController,
    required this.billNumberController
  });

  UserFormInputState copyWith({
    FirstName? firstName,
    LastName? lastName,
    NationalId? nationalId,
    Amount? amount,
    BillNumber? billNumber,
    bool? isDoctor,
    bool? isValid,
    bool? isFormPosted,
    bool? isPosting,
    TextEditingController? lastNameController,
    TextEditingController? firstNameController,
    TextEditingController? amountController,
    TextEditingController? nationalIdController,
    TextEditingController? billNumberController,
  }) =>
      UserFormInputState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nationalId: nationalId ?? this.nationalId,
        amount: amount ?? this.amount,
        billNumber: billNumber ?? this.billNumber,
        isDoctor: isDoctor ?? this.isDoctor,
        isValid: isValid ?? this.isValid,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isPosting: isPosting ?? this.isPosting,
        lastNameController: lastNameController ?? this.lastNameController,
        firstNameController: firstNameController ?? this.firstNameController,
        nationalIdController: nationalIdController ?? this.nationalIdController,
        amountController: amountController ?? this.amountController,
        billNumberController: billNumberController ?? this.billNumberController,
      );
}
