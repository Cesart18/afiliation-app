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
  const _TableBody({ required this.users});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
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

                ...users.map((user) => DataRow(cells: [
                  DataCell(Text(user.firstName)),
                  DataCell(Text(user.lastName)),
                  DataCell((Text(user.isDoctor ? 'Medico' : 'Persona'))),
                  const DataCell(Text('100.00')),
                  const DataCell(Text('5%')),
                ]))
               
               ]),
          ),
        ),
      ),
    );
  }
}


/* 

 */