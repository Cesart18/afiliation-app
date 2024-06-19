import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation.dart';

class NewRegistryWidget extends ConsumerWidget {
  final User? user;
  const NewRegistryWidget({super.key, required this.user,});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final userForm = ref.watch(newUserHistorialProvider(user));
    final isEnabled = userForm.editing;
    final firstNamecontroller = userForm.firstNameController;
    final lastNameController = userForm.lastNameController;
    final nationalIdController = userForm.nationalIdController;
    final amountController = userForm.amountController;
    return Container(

      width: double.infinity,

      constraints: const BoxConstraints(
        maxWidth: 900,
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
            enabled: isEnabled,
            borderColor: isEnabled ? colors.error : null,
            labelText: 'Nombre',
            hintText: 'Luis',
              errorMessage: userForm.isFormPosted ? userForm.firstName.errorMessage : null,
              suffixIcon: ( userForm.firstNameController.value.text.isNotEmpty  && isEnabled ) ? IconButton(onPressed: (){
              }, icon:  Icon(Icons.clear, size: 16 ,color: colors.error,)): null ,
            ),
      ),
          const SizedBox(width: 14,),

      /// Apellido
           Expanded(
            flex: 3,
            child: CustomTextInput(
          controller: lastNameController,
          enabled: isEnabled,
          borderColor: isEnabled ? colors.error : null,
          labelText: 'Apellido',
          hintText: 'Moreno',
              errorMessage: userForm.isFormPosted ? userForm.lastName.errorMessage : null,
              suffixIcon: (userForm.lastNameController.value.text.isNotEmpty  && isEnabled) ? IconButton(onPressed: (){
              }, icon:  Icon(Icons.clear, size: 16 ,color: colors.error,)): null 
            ),
          ),
          const SizedBox(width: 14,),
           Expanded(
            flex: 3,
            child: CustomTextInput(
          controller: nationalIdController,
          enabled: isEnabled,
          borderColor: isEnabled ? colors.error : null,
          labelText: 'Cedula',
          hintText: '123.456.789',
              errorMessage: userForm.isFormPosted ? userForm.nationalId.errorMessage : null,
              suffixIcon: (userForm.nationalIdController.value.text.isNotEmpty && isEnabled) ? IconButton(onPressed: (){
              }, icon:  Icon(Icons.clear, size: 16 ,color: colors.error,)): null ,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
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
            suffixIcon: userForm.amountController.value.text.isNotEmpty ? IconButton(onPressed: (){
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
            initialSelection: userForm.isDoctor,
            enabled: isEnabled,
            borderColor: isEnabled ? colors.error : null,
          )),


          const SizedBox(width: 14,),
          /// boton de continuar
            Tooltip(
              message: 'Agregar nuevo usuario',
              child: PrimaryButton(
              text: 'Aceptar',
              onPressed: (){
              },
                        ),
            ),
        ],
      ),
    );
  }
}


