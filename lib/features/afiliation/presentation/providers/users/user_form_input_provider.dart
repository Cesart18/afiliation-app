import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:afiliados_app/features/afiliation/infrastructure/infrastructure.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';

final userFormInputProvider = StateNotifierProvider.autoDispose<
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
            amountController: TextEditingController()));

  void onFirstNameChanged(String value) {
    final newFirstName = FirstName.dirty(value);
    state = state.copyWith(
        firstName: newFirstName,
        isValid: Formz.validate(
            [newFirstName, state.lastName, state.amount, state.nationalId]));
  }

  void onLastNameChanged(String value) {
    final newLastName = LastName.dirty(value);
    state = state.copyWith(
        lastName: newLastName,
        isValid: Formz.validate(
            [newLastName, state.firstName, state.amount, state.nationalId]));
  }

  void onNationalIdChanged(int value) {
    final newNationalId = NationalId.dirty(value);
    state = state.copyWith(
        nationalId: newNationalId,
        isValid: Formz.validate(
            [newNationalId, state.firstName, state.amount, state.lastName]));
  }

  void onAmountChanged(double value) {
    final newAmount = Amount.dirty(value);
    state = state.copyWith(
        amount: newAmount,
        isValid: Formz.validate(
            [newAmount, state.firstName, state.lastName, state.nationalId]));
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
        isDoctor: state.isDoctor);

    state = state.copyWith(isPosting: false);
    disposeAll();
  }

  initialControllerToUpdate(User? user) {
    state = state.copyWith(
      firstName: FirstName.dirty(user?.firstName ?? ''),
      lastName: LastName.dirty(user?.lastName ?? ''),
      nationalId: NationalId.dirty(user?.nationalId ?? 0),
      isDoctor: user?.isDoctor,
      firstNameController: TextEditingController(text: user?.firstName),
      lastNameController: TextEditingController(text: user?.lastName),
      nationalIdController:
          TextEditingController(text: user?.nationalId.toString()),
    );
  }

  _touchedEveryField() {
    final firstName = FirstName.dirty(state.firstName.value);
    final lastName = LastName.dirty(state.lastName.value);
    final nationalId = NationalId.dirty(state.nationalId.value);
    final amount = Amount.dirty(state.amount.value);

    state = state.copyWith(
        firstName: firstName,
        lastName: lastName,
        nationalId: nationalId,
        amount: amount,
        isFormPosted: true,
        isValid: Formz.validate([firstName, lastName, amount, nationalId]));
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
}

// TODO: la logica que puedo implementar para usuario existente es que al abrirlo los value de los inputs sean sus valores

class UserFormInputState {
  final FirstName firstName;
  final LastName lastName;
  final NationalId nationalId;
  final Amount amount;
  final bool isDoctor;
  final bool isValid;
  final bool isFormPosted;
  final bool isPosting;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController nationalIdController;
  final TextEditingController amountController;

  UserFormInputState({
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.nationalId = const NationalId.pure(),
    this.amount = const Amount.pure(),
    this.isDoctor = false,
    this.isValid = false,
    this.isFormPosted = false,
    this.isPosting = false,
    required this.firstNameController,
    required this.lastNameController,
    required this.nationalIdController,
    required this.amountController,
  });

  UserFormInputState copyWith({
    FirstName? firstName,
    LastName? lastName,
    NationalId? nationalId,
    Amount? amount,
    bool? isDoctor,
    bool? isValid,
    bool? isFormPosted,
    bool? isPosting,
    TextEditingController? lastNameController,
    TextEditingController? firstNameController,
    TextEditingController? amountController,
    TextEditingController? nationalIdController,
  }) =>
      UserFormInputState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nationalId: nationalId ?? this.nationalId,
        amount: amount ?? this.amount,
        isDoctor: isDoctor ?? this.isDoctor,
        isValid: isValid ?? this.isValid,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isPosting: isPosting ?? this.isPosting,
        lastNameController: lastNameController ?? this.lastNameController,
        firstNameController: firstNameController ?? this.firstNameController,
        nationalIdController: nationalIdController ?? this.nationalIdController,
        amountController: amountController ?? this.amountController,
      );
}
