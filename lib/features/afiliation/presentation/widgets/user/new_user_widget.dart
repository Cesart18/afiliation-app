import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation.dart';

class NewUserWidget extends ConsumerWidget {
  const NewUserWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final colors = Theme.of(context).colorScheme;
    final userForm = ref.watch(userFormInputProvider);
    final userFormNotifier = ref.read(userFormInputProvider.notifier);
    final firstNamecontroller = userForm.firstNameController;
    final lastNameController = userForm.lastNameController;
    final nationalIdController = userForm.nationalIdController;
    final amountController = userForm.amountController;
    final billNumberController = userForm.billNumberController;

    return Container(

      width: double.infinity,
      // height: double.infinity,

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
          labelText: 'Nombre',
          hintText: 'Luis',
                errorMessage: userForm.isFormPosted ? userForm.firstName.errorMessage : null,
          onChanged: ref.read(userFormInputProvider.notifier).onFirstNameChanged,
                onFieldSubmitted: (_) => ref.read(userFormInputProvider.notifier).onFormsumbit(),
                suffixIcon: userForm.firstNameController.value.text.isNotEmpty ? IconButton(onPressed: (){
                    ref.read(userFormInputProvider.notifier).clearFistName();
                }, icon:  Icon(Icons.clear, size: 16 ,color: colors.error,)): null ,
              ),
        ),
            const SizedBox(width: 14,),
        
        /// Apellido
             Expanded(
              flex: 3,
              child: CustomTextFormField(
            controller: lastNameController,
            labelText: 'Apellido',
            hintText: 'Moreno',
                errorMessage: userForm.isFormPosted ? userForm.lastName.errorMessage : null,
            onChanged: ref.read(userFormInputProvider.notifier).onLastNameChanged,
                onFieldSubmitted: (_) => ref.read(userFormInputProvider.notifier).onFormsumbit(),
                suffixIcon: userForm.lastNameController.value.text.isNotEmpty ? IconButton(onPressed: (){
                      ref.read(userFormInputProvider.notifier).clearLastName();
                }, icon:  Icon(Icons.clear, size: 16 ,color: colors.error,)): null 
              ),
            ),
            const SizedBox(width: 14,),
             Expanded(
              flex: 3,
              child: CustomTextFormField(
            controller: nationalIdController,
            labelText: 'Cédula',
            hintText: '123.456.789',
                errorMessage: userForm.isFormPosted ? userForm.nationalId.errorMessage : null,
            onChanged: (value) => ref.read(userFormInputProvider.notifier).onNationalIdChanged( int.tryParse(value) ?? 0 ),
                onFieldSubmitted: (_) => ref.read(userFormInputProvider.notifier).onFormsumbit(),
                suffixIcon: userForm.nationalIdController.value.text.isNotEmpty ? IconButton(onPressed: (){
                      ref.read(userFormInputProvider.notifier).clearNationalId();
                }, icon:  Icon(Icons.clear, size: 16 ,color: colors.error,)): null ,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
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
              labelText: 'Monto facturado',
              hintText: '10.00',
              errorMessage: userForm.isFormPosted ? userForm.amount.errorMessage : null,
              onChanged: (value) => ref.read(userFormInputProvider.notifier).onAmountChanged( double.tryParse(value) ?? 0.0 ),
              onFieldSubmitted: (_) => ref.read(userFormInputProvider.notifier).onFormsumbit(),
              suffixIcon: userForm.amountController.value.text.isNotEmpty ? IconButton(onPressed: (){
                ref.read(userFormInputProvider.notifier).clearAmount();
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
              labelText: 'Numero de factura',
              hintText: '0000',
              errorMessage: (userForm.isFormPosted ) ? userForm.billNumber.errorMessage : null,
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
              label: '¿Es medico?',
              onSelected: ref.read(userFormInputProvider.notifier).onTypeUserChanged,
              initialSelection: userForm.isDoctor,
            )),
        
        
            const SizedBox(width: 14,),
            /// boton de continuar
              Tooltip(
                message: 'Agregar nuevo usuario',
                child: PrimaryButton(
                text: 'Aceptar',
                onPressed: (){
                  ref.read(userFormInputProvider.notifier).onFormsumbit();
                },
                          ),
              ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


