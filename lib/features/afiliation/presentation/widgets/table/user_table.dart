import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:flutter/material.dart';

class UserTable extends StatelessWidget {
  final User? user;
  const UserTable({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
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
                  color: colors.onSurface,
                ),
                borderRadius: BorderRadius.circular(8),
              ),

              /// column of table
              columns:  [
                DataColumn(
                  tooltip: 'Ordernar por fecha',
                  onSort: (columnIndex, ascending) {
                    // TODO: implementar el sort
                  },
                    label: const Text(
                  'Fecha',
                  overflow: TextOverflow.ellipsis,
                )),
                DataColumn(
                  tooltip: 'Ordernar por monto',
                  onSort: (columnIndex, ascending) {
                  },
                    label: const Text(
                  'Monto',
                  overflow: TextOverflow.ellipsis,
                )),
                
              ],
              rows: [
                ...user?.historial.toList().map((historial) => _customDataRow(historial, context)) ?? []
              ]),
        ),
      ),
    );
  }

  DataRow _customDataRow(UserHistorial historial, BuildContext context) {
    return  DataRow(
      cells: [
        // TODO: formatear la hora
      DataCell(Text('${historial.date}')),
      DataCell(Text('${historial.amount}')),
    ]);
  }

}