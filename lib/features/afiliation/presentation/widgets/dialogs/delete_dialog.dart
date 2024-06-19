import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DeleteDialog extends ConsumerWidget {
  final String firstName;
  final Function() callback;
  const DeleteDialog({super.key,required  this.firstName, required this.callback, });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return AlertDialog(
      title: Text('Alerta',
      style: TextStyle(color: colors.error),),
      content: IntrinsicHeight(
        child: Text('Estas seguro que deseas eliminar "$firstName"'),
      ),
      actions: [
        ActionChip(
          label:  Text('Aceptar', style: TextStyle(color: colors.onError),),
          color: WidgetStatePropertyAll(colors.error),
          onPressed: (){
            context.pop();
            callback();
          },
          ),
        ActionChip(
          label:  Text('Cancelar',style: TextStyle(color: colors.onSurface),),
          color: WidgetStatePropertyAll(colors.surface),
          onPressed: (){
            context.pop();
          },
          ),
      ],
    );
  }
}