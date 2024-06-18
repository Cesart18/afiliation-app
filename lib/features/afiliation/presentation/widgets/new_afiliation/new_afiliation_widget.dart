import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation.dart';

class NewAfiliationWidget extends ConsumerWidget {
  const NewAfiliationWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final userForm = ref.watch(userFormInputProvider);
    final firstNamecontroller = userForm.firstNameController;
    final lastNameController = userForm.lastNameController;
    final amountController = userForm.amountController;
    return Container(

      width: double.infinity,
      // height: double.infinity,

      constraints: const BoxConstraints(
        maxWidth: 840,
        maxHeight: 120,
        minWidth: 500
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: colors.onSurface
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),

      child:  Row(
        children: [

          /// Nombre
           Expanded(
            flex: 3,
            child: CustomTextInput(
              controller: firstNamecontroller,
              labelText: 'Nombre',
              hintText: 'Luis',
              errorMessage: userForm.isFormPosted ? userForm.firstName.errorMessage : null,
              onChanged: ref.read(userFormInputProvider.notifier).onFirstNameChanged,
              onFieldSubmitted: (p) => ref.read(userFormInputProvider.notifier).onFormsumbit(),
              suffixIcon: userForm.firstNameController!.value.text.isNotEmpty ? IconButton(onPressed: (){
                ref.read(userFormInputProvider.notifier).clearFistName();
              }, icon:  Icon(Icons.clear, size: 16 ,color: colors.error,)): null ,
            ),
          ),
          const SizedBox(width: 14,),

          /// Apellido
           Expanded(
            flex: 3,
            child: CustomTextInput(
              controller: lastNameController,
              labelText: 'Apellido',
              hintText: 'Moreno',
              errorMessage: userForm.isFormPosted ? userForm.lastName.errorMessage : null,
              onChanged: ref.read(userFormInputProvider.notifier).onLastNameChanged,
              onFieldSubmitted: (p) => ref.read(userFormInputProvider.notifier).onFormsumbit(),
              suffixIcon: userForm.lastNameController!.value.text.isNotEmpty ? IconButton(onPressed: (){
                ref.read(userFormInputProvider.notifier).clearLastName();
              }, icon:  Icon(Icons.clear, size: 16 ,color: colors.error,)): null 
            ),
          ),
          const SizedBox(width: 14,),

          /// Monto facturado
          Expanded(
            flex: 2,
            child: CustomTextInput(
              controller: amountController,
              labelText: 'Monto facturado',
              hintText: '10.00',
              errorMessage: userForm.isFormPosted ? userForm.amount.errorMessage : null,
              onChanged: ref.read(userFormInputProvider.notifier).onAmountChanged,
              onFieldSubmitted: (p) => ref.read(userFormInputProvider.notifier).onFormsumbit(),
              suffixIcon: userForm.amountController!.value.text.isNotEmpty ? IconButton(onPressed: (){
                ref.read(userFormInputProvider.notifier).clearAmount();
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
            onSelected: ref.read(userFormInputProvider.notifier).onTypeUserChanged,
            initialSelection: userForm.isDoctor,
          )),


          const SizedBox(width: 20,),
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
      ),
    );
  }
}


