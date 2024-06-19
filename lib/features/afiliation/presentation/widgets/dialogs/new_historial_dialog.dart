
import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NewHistorialDialog extends ConsumerWidget {
  final User user;
  const NewHistorialDialog({super.key, required this.user});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final userForm = ref.watch(newUserHistorialProvider(user));
    final userFormNotifier = ref.read(newUserHistorialProvider(user).notifier);
    return AlertDialog(
      title: Text('Nuevo registro para ${userForm.firstName.value}'),
      content: Expanded(
            flex: 2,
            child: CustomTextInput(
            controller: userForm.amountController,
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
          actions: [
            ActionChip(
          label:  Text('Cancelar',style: TextStyle(color: colors.error),),
          color: WidgetStatePropertyAll(colors.onError),
          onPressed: (){
            context.pop();
          },
          ),
             ActionChip(
          label:  Text('Aceptar', style: TextStyle(color: colors.onSurface),),
          color: WidgetStatePropertyAll(colors.surface),
          onPressed: (){
            userFormNotifier.onFormsumbit();
            if( userForm.amount.isNotValid ) return;
            context.pop();
          },
          ),
        
          ],
    );
  }
}