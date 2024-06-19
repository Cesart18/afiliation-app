import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UsersTable extends ConsumerStatefulWidget {
  const UsersTable({super.key});

  @override
  UsersTableState createState() => UsersTableState();
}

class UsersTableState extends ConsumerState<UsersTable> {
  @override
  Widget build(BuildContext context) {
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
                  tooltip: 'Ordenar por cédula',
                  onSort: (columnIndex, ascending) {
                    
                  },
                    label: const Text(
                  'Cédula',
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
                context.push('/user/${user.id}');
             }, icon: const Icon(Icons.file_open_rounded,)),
           ),
      ),
      DataCell(Text(Formatters.firstLetterToUpper(user.firstName))),
      DataCell(Text(Formatters.firstLetterToUpper(user.lastName))),
      DataCell(Text(Formatters.formatNationalId(user.nationalId))),
      DataCell((Text(user.isDoctor ? 'Medico' : 'Usuario'))),
      DataCell(Text('${ Formatters.totalAmount(user.historial.toList()) }')),
      const DataCell(Text('5%')),
       DataCell(Row(
         children: [
          
            Tooltip(
            message: 'Agregar nuevo registro',
             child: IconButton(onPressed: (){
                Functions.showModal(context, NewHistorialDialog(user: user));
             }, icon: const Icon(Icons.note_add, color: Colors.green,)),
           ),
           Tooltip(
            message: 'Eliminar usuario',
             child: IconButton(onPressed: (){
              Functions.showModal(context, DeleteDialog(
                firstName: 'a ${Formatters.firstLetterToUpper(user.firstName)}',
                callback: () => ref.read(usersProvider.notifier).deleteUser(user.id ?? 0),));
             }, icon: const Icon(Icons.delete, color: Colors.red,)),
           ),
         ],
       )),
    ]);
  }
}



