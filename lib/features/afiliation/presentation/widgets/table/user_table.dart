import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserTable extends ConsumerWidget {
  final int userId;
  final List<UserHistorial>? historial;
  const UserTable({super.key, required this.historial, required this.userId});

  @override
  Widget build(BuildContext context, ref) {
    
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    final sortState = ref.watch(sortHistorialProvider);

    List<UserHistorial> sortedHistorial = List.from(historial ?? []);
    if (sortState.columnIndex == 0) {
      // Ordenar por fecha
      sortedHistorial.sort((a, b) => sortState.ascending
          ? a.date.compareTo(b.date)
          : b.date.compareTo(a.date));
    } else if (sortState.columnIndex == 1) {
      // Ordenar por monto
      sortedHistorial.sort((a, b) => sortState.ascending
          ? a.amount.compareTo(b.amount)
          : b.amount.compareTo(a.amount));
    }


    return Expanded(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
    
          /// table of users
          child: DataTable(
            sortColumnIndex: sortState.columnIndex,
            sortAscending: sortState.ascending,
              columnSpacing: size.width * 0.1,
              border: TableBorder.symmetric(
                outside: BorderSide(
                  color: colors.onSurface,
                ),
                inside: BorderSide(
                  color: colors.onSurface,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
    
              /// column of table
              columns:  [
                DataColumn(
                  tooltip: 'Ordernar por fecha',
                  onSort: (columnIndex, _) {
                    ref.read(sortHistorialProvider.notifier).sort(columnIndex);
                  },
                    label: const Text(
                  'Fecha',
                  overflow: TextOverflow.ellipsis,
                )),
                DataColumn(
                  tooltip: 'Ordernar por monto',
                  onSort: (columnIndex, ascending) {
                    ref.read(sortHistorialProvider.notifier).sort(columnIndex);
                  },
                    label: const Text(
                  'Monto',
                  overflow: TextOverflow.ellipsis,
                )),
                const DataColumn(label:  Text('')),
                
              ],
              rows: [
                ...sortedHistorial.toList().map((historial) => _customDataRow(historial, context, ref, userId)) 
              ]),
        ),
      ),
    );
  }
}

DataRow _customDataRow(UserHistorial historial, BuildContext context, WidgetRef ref, int userId) {
    return  DataRow(
      cells: [
      DataCell(Text(Formatters.formatDateTime(historial.date))),
      DataCell(Text('${historial.amount}\$')),
      DataCell(Tooltip(
            message: 'Eliminar registro',
             child: IconButton(onPressed: (){
              Functions.showModal(context, DeleteDialog(firstName: 'el registro',
              callback: () => ref.read(usersProvider.notifier).deleteHistorial(userId,historial.id ?? 0)));
             }, icon: const Icon(Icons.delete, color: Colors.red,)),
           ),)
    ]);
  }