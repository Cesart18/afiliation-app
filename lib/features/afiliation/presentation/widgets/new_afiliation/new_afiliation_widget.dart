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
    return Container(

      width: double.infinity,
      // height: double.infinity,

      constraints: const BoxConstraints(
        maxWidth: 840,
        maxHeight: 70,
        minWidth: 500
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: colors.onSurface
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),

      child:  Row(
        children: [

          /// Nombre
           Expanded(
            flex: 3,
            child: CustomTextInput(
              labelText: 'Nombre',
              hintText: 'Luis',
              errorMessage: userForm.isFormPosted ? userForm.firstName.errorMessage : null,
              onChanged: ref.read(userFormInputProvider.notifier).onFirstNameChanged,
            ),
          ),
          const SizedBox(width: 10,),

          /// Apellido
           Expanded(
            flex: 3,
            child: CustomTextInput(
              labelText: 'Apellido',
              hintText: 'Moreno',
              errorMessage: userForm.isFormPosted ? userForm.lastName.errorMessage : null,
              onChanged: ref.read(userFormInputProvider.notifier).onLastNameChanged,
            ),
          ),
          const SizedBox(width: 10,),

          /// Monto facturado
          Expanded(
            flex: 2,
            child: CustomTextInput(
              labelText: 'Monto facturado',
              hintText: '10.00',
              errorMessage: userForm.isFormPosted ? userForm.amount.errorMessage : null,
              onChanged: ref.read(userFormInputProvider.notifier).onAmountChanged,
              textAlign: TextAlign.end,
              inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
              ],
            ),
          ),
          const SizedBox(width: 10,),

          /// Tipo de usuario
           FittedBox(child: CustomDrowdownButton(
            onSelected: ref.read(userFormInputProvider.notifier).onTypeUserChanged,
          )),


          const SizedBox(width: 20,),
          // TODO: ver la posibilidad de un boton de clear all
          /// boton de continuar
            PrimaryButton(
            text: 'Aceptar',
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}


