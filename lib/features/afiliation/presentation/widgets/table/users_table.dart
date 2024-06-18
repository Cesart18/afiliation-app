import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class _TableBody extends StatelessWidget {
  final List<User> users;
  const _TableBody({required this.users});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return Expanded(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
              columnSpacing: size.width * 0.03,
              border: TableBorder.symmetric(
                outside: BorderSide(
                  color: colors.onSurface,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              columns:  [
                const DataColumn(label: Text('')),
                DataColumn(
                  tooltip: 'Ordernar por nombre',
                  onSort: (columnIndex, ascending) {
                    
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
                ...users.map((user) => _customDataRow(user, context))
              ]),
        ),
      ),
    );
  }

  DataRow _customDataRow(User user, BuildContext context) {
    return DataRow(
      cells: [
      DataCell(
        Tooltip(
            message: 'Registro del usuario',
             child: IconButton(onPressed: (){
              // TODO: hacer un modal
             }, icon: const Icon(Icons.file_open_rounded,)),
           ),
      ),
      DataCell(Text(TextFormatter.firstLetterToUpper(user.firstName))),
      DataCell(Text(TextFormatter.firstLetterToUpper(user.lastName))),
      DataCell((Text(user.isDoctor ? 'Medico' : 'Persona'))),
      const DataCell(Text('100.00')),
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