import 'package:afiliados_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:afiliados_app/features/afiliation/infrastructure/infrastructure.dart';
import 'package:afiliados_app/features/afiliation/domain/domain.dart';

final newUserHistorialProvider = StateNotifierProvider.family<NewUserHistorialNotifier,NewUserHistorialState, User?>((ref, user) {
  return NewUserHistorialNotifier(user: user);
});

class NewUserHistorialNotifier extends StateNotifier<NewUserHistorialState> {
  final User? user;
  NewUserHistorialNotifier({ required this.user })
      : super(NewUserHistorialState(
        firstNameController: TextEditingController(text: TextFormatter.firstLetterToUpper(user?.firstName ?? 'No hay')),
        lastNameController: TextEditingController(text: TextFormatter.firstLetterToUpper(user?.lastName ?? 'No hay')),
        nationalIdController: TextEditingController(text: user?.nationalId.toString()),
        amountController: TextEditingController()
      )){
        _initValues();
      }
  
    _initValues(){
      state = state.copyWith(
        firstName: FirstName.dirty(TextFormatter.firstLetterToUpper(user?.firstName ?? 'No hay')),
        lastName: LastName.dirty(TextFormatter.firstLetterToUpper(user?.lastName ?? 'No hay')),
        nationalId: NationalId.dirty(user?.nationalId ?? 0),
      );
    }

}

class NewUserHistorialState {
  final FirstName firstName;
  final LastName lastName;
  final NationalId nationalId;
  final Amount amount;
  final bool isDoctor;
  final bool isValid;
  final bool isFormPosted;
  final bool isPosting;
  final bool editing;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController nationalIdController;
  final TextEditingController amountController;

  NewUserHistorialState({
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.nationalId = const NationalId.pure(),
    this.amount = const Amount.pure(),
    this.isDoctor = false,
    this.isValid = false,
    this.isFormPosted = false,
    this.isPosting = false,
    this.editing = false,
    required this.firstNameController,
    required this.lastNameController,
    required this.nationalIdController,
    required this.amountController,
  });

  NewUserHistorialState copyWith({
    FirstName? firstName,
    LastName? lastName,
    NationalId? nationalId,
    Amount? amount,
    bool? isDoctor,
    bool? isValid,
    bool? isFormPosted,
    bool? isPosting,
    bool? editing,
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? nationalIdController,
    TextEditingController? amountController,
  }) =>
      NewUserHistorialState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nationalId: nationalId ?? this.nationalId,
        amount: amount ?? this.amount,
        isDoctor: isDoctor ?? this.isDoctor,
        isValid: isValid ?? this.isValid,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isPosting: isPosting ?? this.isPosting,
        editing: editing ?? this.editing,
        firstNameController: firstNameController ?? this.firstNameController,
        lastNameController: lastNameController ?? this.lastNameController,
        nationalIdController: nationalIdController ?? this.nationalIdController,
        amountController: amountController ?? this.amountController,
      );
}
