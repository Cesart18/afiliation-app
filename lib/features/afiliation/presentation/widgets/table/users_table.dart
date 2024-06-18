import 'package:flutter/material.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      onSelectAll: (value) {},
      showCheckboxColumn: true,
      checkboxHorizontalMargin: 10,
      border: TableBorder.all(),
      sortColumnIndex: 1,
      dataTextStyle: TextStyle(),
      horizontalMargin: 10,
      headingRowHeight: 100,
      sortAscending: true,
      columnSpacing: 10,
      showBottomBorder: true,
      columns: [
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Apellido')),
        DataColumn(label: Text('Monto facturado')),
      ],
       rows: [
        DataRow(
          onSelectChanged: (value) {
            
          },
          selected: true,
          cells: [
          DataCell(Text('cesar')),
          DataCell(Text('tovar')),
          DataCell(Text('100.00')),
        ])
       ]);
  }
}