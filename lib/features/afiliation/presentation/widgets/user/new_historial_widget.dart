import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:afiliados_app/features/auth/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation.dart';

class NewHistorialWidget extends ConsumerWidget {
  final User? user;
  const NewHistorialWidget({super.key, required this.user,});
  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final userForm = ref.watch(newUserHistorialProvider(user));
    final userFormNotifier = ref.read(newUserHistorialProvider(user).notifier);
    final isEnabled = userForm.editing;
    final firstNamecontroller = userForm.firstNameController;
    final lastNameController = userForm.lastNameController;
    final nationalIdController = userForm.nationalIdController;
    final amountController = userForm.amountController;
    final billNumberController = userForm.billNumberController;
    final authStatus = ref.watch(authProvider).authStatus;
    return Container(

      width: double.infinity,

      constraints: const BoxConstraints(
        maxWidth: 900,
        maxHeight: 240,
        minWidth: 500
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: colors.onSurface
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),

      child:  IntrinsicHeight(
        child: Column(
          children: [
        
            Row(
              children: [
                 /// Nombre
             Expanded(
              flex: 3,
              child: CustomTextFormField(
              controller: firstNamecontroller,
              enabled: isEnabled,
              borderColor: isEnabled ? colors.error : null,
              labelText: 'Nombre',
              hintText: 'Luis',
                errorMessage: userForm.firstName.errorMessage ,
                onChanged: userFormNotifier.onFirstNameChanged,
                onFieldSubmitted: (_) => userFormNotifier.onFormsumbit(),
                suffixIcon: ( userForm.firstNameController.value.text.isNotEmpty  && isEnabled ) ? IconButton(onPressed: (){
                  userFormNotifier.clearFistName();
                }, icon:  Icon(Icons.clear, size: 16 ,color: colors.error,)): null ,
              ),
        ),
            const SizedBox(width: 14,),
        
        /// Apellido
             Expanded(
              flex: 3,
              child: CustomTextFormField(
            controller: lastNameController,
            enabled: isEnabled,
            borderColor: isEnabled ? colors.error : null,
            labelText: 'Apellido',
            hintText: 'Moreno',
                errorMessage: userForm.lastName.errorMessage,
                onChanged: userFormNotifier.onLastNameChanged,
                onFieldSubmitted: (_) => userFormNotifier.onFormsumbit(),
                suffixIcon: (userForm.lastNameController.value.text.isNotEmpty  && isEnabled) ? IconButton(onPressed: (){
                  userFormNotifier.clearLastName();
                }, icon:  Icon(Icons.clear, size: 16 ,color: colors.error,)): null 
              ),
            ),
            const SizedBox(width: 14,),
             Expanded(
              flex: 3,
              child: CustomTextFormField(
            controller: nationalIdController,
            enabled: isEnabled,
            borderColor: isEnabled ? colors.error : null,
            labelText: 'Cédula',
            hintText: '123.456.789',
                errorMessage: userForm.nationalId.errorMessage ,
                onChanged: (value) => userFormNotifier.onNationalIdChanged(int.tryParse(value) ?? 0),
                onFieldSubmitted: (_) => userFormNotifier.onFormsumbit(),
                suffixIcon: (userForm.nationalIdController.value.text.isNotEmpty && isEnabled) ? IconButton(onPressed: (){
                  userFormNotifier.clearNationalId();
                }, icon:  Icon(Icons.clear, size: 16 ,color: colors.error,)): null ,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            const SizedBox(width: 14,),
            FittedBox(child: CustomDrowdownButton(
              label: '¿Es medico?',
              initialSelection: userForm.isDoctor,
              onSelected: userFormNotifier.onTypeUserChanged,
              enabled: isEnabled,
              borderColor: isEnabled ? colors.error : null,
            )),
              ],
            ),
            const SizedBox(height: 20,),
        
            Row(
              children: [
                      /// Monto facturado
            Expanded(
              flex: 2,
              child: CustomTextFormField(
              controller: amountController,
              enabled: !isEnabled,
              labelText: 'Monto facturado',
              hintText: '10.00',
              errorMessage: (userForm.isFormPosted && !userForm.editing) ? userForm.amount.errorMessage : null,
              onChanged: (value) => userFormNotifier.onAmountChanged(double.tryParse(value) ?? 0.0),
              onFieldSubmitted: (_) => userFormNotifier.onFormsumbit(),
              suffixIcon: userForm.amountController.value.text.isNotEmpty ? IconButton(onPressed: (){
                userFormNotifier.clearAmount();
              }, icon:  Icon(Icons.clear, size: 16 ,color: colors.error,)): null ,
              textAlign: TextAlign.end,
              inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
              ],
            ),
            ),
            const SizedBox(width: 14,),
            Expanded(
              flex: 2,
              child: CustomTextFormField(
              controller: billNumberController,
              enabled: !isEnabled,
              labelText: 'Numero de factura',
              hintText: '0000',
              errorMessage: (userForm.isFormPosted && !userForm.editing) ? userForm.billNumber.errorMessage : null,
              onChanged: (value) => userFormNotifier.onBillNumberChanged(int.tryParse(value) ?? 0),
              onFieldSubmitted: (_) => userFormNotifier.onFormsumbit(),
              suffixIcon: userForm.billNumberController.value.text.isNotEmpty ? IconButton(onPressed: (){
                userFormNotifier.clearBillNumber();
              }, icon:  Icon(Icons.clear, size: 16 ,color: colors.error,)): null ,
              textAlign: TextAlign.end,
              inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
              ],
            ),
            ),
            const SizedBox(width: 14,),
        
            /// Tipo de usuario
             
            FittedBox(child: CustomDrowdownButton(
              label: '¿Usó el cupon?',
              initialSelection: false,
              // onSelected: userFormNotifier.onTypeUserChanged,
              enabled: !isEnabled,
              borderColor: colors.onSurface,
            )),
        
            const SizedBox(width: 14,),
            /// boton de continuar
              Tooltip(
                message: 'Agregar nuevo usuario',
                child: PrimaryButton(
                text: 'Aceptar',
                onPressed: (){
                  userFormNotifier.onFormsumbit();
                }),
              ),
              if( authStatus == AuthStatus.authenticated )
            const SizedBox(width: 14,),
              if( authStatus == AuthStatus.authenticated )
              Tooltip(
                message: 'Editar usuario',
                child: IconButton(
                  onPressed: (){
                    userFormNotifier.toggleEdit();
                  },
                  icon: const Icon(Icons.edit),
                )
              ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


