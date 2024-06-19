import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UsersTable extends ConsumerWidget {
  const UsersTable({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final usersAsync = ref.watch(usersStreamProvider);
    return usersAsync.when(
        data: (data) => _TableBody(users: data),
        error: (error, stackTrace) => Text('$error'),
        loading: () => const CircularProgressIndicator());
  }
}

class _TableBody extends ConsumerWidget {
  final List<User> users;
  const _TableBody({required this.users});

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return Expanded(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,

          /// table of users
          child: DataTable(
              columnSpacing: size.width * 0.03,
              border: TableBorder.symmetric(
                outside: BorderSide(
                  color: colors.onSurface,
                ),
                inside: BorderSide(
                  color: colors.onSurface
                ),
                borderRadius: BorderRadius.circular(8),
              ),

              /// column of table
              columns:  [
                const DataColumn(label: Text('')),
                DataColumn(
                  tooltip: 'Ordernar por nombre',
                  onSort: (columnIndex, ascending) {
                    // TODO: implementar el sort
                  },
                    label: const Text(
                  'Nombre',
                  overflow: TextOverflow.ellipsis,
                )),
                DataColumn(
                  tooltip: 'Ordernar por apellido',
                  onSort: (columnIndex, ascending) {
                    
                  },
                    label: const Text(
                  'Apellido',
                  overflow: TextOverflow.ellipsis,
                )),
                DataColumn(
                  tooltip: 'Ordenar por cedula',
                  onSort: (columnIndex, ascending) {
                    
                  },
                    label: const Text(
                  'Cedula',
                  overflow: TextOverflow.ellipsis,
                )),
                DataColumn(
                  tooltip: 'Ordernar por tipo de usuario',
                  onSort: (columnIndex, ascending) {
                    
                  },
                    label: const Text(
                  'Tipo de usuario',
                  overflow: TextOverflow.ellipsis,
                )),
                DataColumn(
                  tooltip: 'Ordernar por monto facturado',
                  onSort: (columnIndex, ascending) {
                    
                  },
                    label: const Text(
                  'Monto facturado',
                  overflow: TextOverflow.ellipsis,
                )),
                 DataColumn(
                  tooltip: 'Ordernar por descuento',
                  onSort: (columnIndex, ascending) {
                    
                  },
                    label: const Text(
                  'Descuento',
                  overflow: TextOverflow.ellipsis,
                )),
                 const DataColumn(label: Text('')),
              ],
              rows: [
                ...users.map((user) => _customDataRow(user, context, ref))
              ]),
        ),
      ),
    );
  }

  DataRow _customDataRow(User user, BuildContext context, WidgetRef ref) {
    return DataRow(
      cells: [
      DataCell(
        Tooltip(
            message: 'Registro del usuario',
             child: IconButton(onPressed: (){
                ref.read(userFormInputProvider.notifier).initialControllerToUpdate(user);
                context.push('/user/${user.id}');
             }, icon: const Icon(Icons.file_open_rounded,)),
           ),
      ),
      DataCell(Text(TextFormatter.firstLetterToUpper(user.firstName))),
      DataCell(Text(TextFormatter.firstLetterToUpper(user.lastName))),
      DataCell(Text('${user.nationalId}')),
      DataCell((Text(user.isDoctor ? 'Medico' : 'Usuario'))),
      DataCell(Text('${ _totalAmount(user.historial.toList()) }')),
      const DataCell(Text('5%')),
       DataCell(Row(
         children: [
          
            Tooltip(
            message: 'Agregar nuevo registro',
             child: IconButton(onPressed: (){
              // TODO: hacer un modal
             }, icon: const Icon(Icons.note_add, color: Colors.green,)),
           ),
           Tooltip(
            message: 'Eliminar usuario',
             child: IconButton(onPressed: (){
              _showModal(context, DeleteUserDialog(TextFormatter.firstLetterToUpper(user.firstName),user.id!));
             }, icon: const Icon(Icons.delete, color: Colors.red,)),
           ),
         ],
       )),
    ]);
  }
}

_showModal(BuildContext context, Widget widget ){
  showDialog(context: context, builder: (context) {
    return widget;
  },);
}

double _totalAmount( List<UserHistorial> historial ){
  double totalAmount = 0;
  final listHistorial = historial.toList();
    for ( final amount in listHistorial ){
      totalAmount += amount.amount;
    }
  return totalAmount;
}