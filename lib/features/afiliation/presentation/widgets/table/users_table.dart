import 'package:flutter/material.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Scrollbar(
            interactive: true,
            scrollbarOrientation: ScrollbarOrientation.bottom,
            child: DataTable(
              
              columnSpacing: size.width * 0.05,
              border: TableBorder.symmetric(
                outside: BorderSide(
                  color: colors.onSurface,
                ),
                borderRadius: BorderRadius.circular(8),
            
              ),
              columns: const [
                DataColumn(label: Text('Nombre',
                overflow: TextOverflow.ellipsis,)),
                DataColumn(label: Text('Apellido',
                overflow: TextOverflow.ellipsis,)),
                DataColumn(label: Text('Tipo de usuario',
                overflow: TextOverflow.ellipsis,)),
                DataColumn(label: Text('Monto facturado',
                overflow: TextOverflow.ellipsis,)),
                DataColumn(label: Text('Descuento',
                overflow: TextOverflow.ellipsis,)),
            
              ],
               rows: [
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
                DataRow(
                  onSelectChanged: (value) {
                  },
                  selected: false,
                  cells:  const [
                    DataCell(Text('Cesar')),
                    DataCell(Text('Tovar')),
                    DataCell(Text('Usuario')),
                    DataCell(Text('100.0')),
                    DataCell(Text('5%')),
                ]),
               ]),
          ),
        ),
      ),
    );
  }
}