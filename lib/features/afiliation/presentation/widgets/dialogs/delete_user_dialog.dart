import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DeleteUserDialog extends ConsumerWidget {
  final String firstName;
  final int userId;
  const DeleteUserDialog(this.firstName, this.userId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return AlertDialog(
      title: Text('Alerta',
      style: TextStyle(color: colors.error),),
      content: IntrinsicHeight(
        child: Text('Estas seguro que deseas eliminar a "$firstName"'),
      ),
      actions: [
        ActionChip(
          label:  Text('Aceptar', style: TextStyle(color: colors.onError),),
          color: WidgetStatePropertyAll(colors.error),
          onPressed: (){
            context.pop();
            ref.read(usersProvider.notifier).deleteUser(userId);
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