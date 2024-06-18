import 'package:afiliados_app/features/afiliation/infrastructure/infrastructure.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final userFormInputProvider = StateNotifierProvider.autoDispose<
    UserFormInputNotifier, UserFormInputState>((ref) {
  final userNotifier = ref.watch(usersProvider.notifier);
  return UserFormInputNotifier(userNotifier: userNotifier);
});

class UserFormInputNotifier extends StateNotifier<UserFormInputState> {
  final UsersNotifier userNotifier;
  UserFormInputNotifier({required this.userNotifier})
      : super(UserFormInputState()) {
    initControllers();
  }

  void onFirstNameChanged(String value) {
    final newFirstName = FirstName.dirty(value);
    state = state.copyWith(
        firstName: newFirstName,
        isValid: Formz.validate([newFirstName, state.lastName, state.amount]));
  }

  void onLastNameChanged(String value) {
    final newLastName = LastName.dirty(value);
    state = state.copyWith(
        lastName: newLastName,
        isValid: Formz.validate([newLastName, state.firstName, state.amount]));
  }

  void onAmountChanged(String value) {
    final newAmount = Amount.dirty(double.parse(value));
    state = state.copyWith(
        amount: newAmount,
        isValid: Formz.validate([newAmount, state.firstName, state.lastName]));
  }

  void onTypeUserChanged(bool? value) {
    state = state.copyWith(isDoctor: value);
  }

  void onFormsumbit() async {
    _touchedEveryField();
    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);

    await userNotifier.createNewUser(
        firstName: state.firstName.value,
        lastName: state.lastName.value,
        amount: state.amount.value,
        isDoctor: state.isDoctor);

    state = state.copyWith(isPosting: false);
    disposeAll();
  }

  _touchedEveryField() {
    final firstName = FirstName.dirty(state.firstName.value);
    final lastName = LastName.dirty(state.lastName.value);
    final amount = Amount.dirty(state.amount.value);

    state = state.copyWith(
        firstName: firstName,
        lastName: lastName,
        amount: amount,
        isFormPosted: true,
        isValid: Formz.validate([firstName, lastName, amount]));
  }

  void disposeAll() {
    state = state.copyWith(
        isDoctor: false, isValid: false, isFormPosted: false, isPosting: false);
    clearControllers();
  }

  initControllers() {
    state = state.copyWith(
        firstNameController: TextEditingController(),
        lastNameController: TextEditingController(),
        amountController: TextEditingController());
  }

  clearControllers() {
    clearFistName();
    clearLastName();
    clearAmount();
  }

  clearFistName() {
    state = state.copyWith(firstName: const FirstName.pure());
    state.firstNameController?.clear();
  }

  clearLastName() {
    state = state.copyWith(lastName: const LastName.pure());
    state.lastNameController?.clear();
  }

  clearAmount() {
    state = state.copyWith(amount: const Amount.pure());
    state.amountController?.clear();
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
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? amountController;

  UserFormInputState({
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.amount = const Amount.pure(),
    this.isDoctor = false,
    this.isValid = false,
    this.isFormPosted = false,
    this.isPosting = false,
    this.firstNameController,
    this.lastNameController,
    this.amountController,
  });

  UserFormInputState copyWith({
    FirstName? firstName,
    LastName? lastName,
    Amount? amount,
    bool? isDoctor,
    bool? isValid,
    bool? isFormPosted,
    bool? isPosting,
    TextEditingController? lastNameController,
    TextEditingController? firstNameController,
    TextEditingController? amountController,
  }) =>
      UserFormInputState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        amount: amount ?? this.amount,
        isDoctor: isDoctor ?? this.isDoctor,
        isValid: isValid ?? this.isValid,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isPosting: isPosting ?? this.isPosting,
        lastNameController: lastNameController ?? this.lastNameController,
        firstNameController: firstNameController ?? this.firstNameController,
        amountController: amountController ?? this.amountController,
      );
}
