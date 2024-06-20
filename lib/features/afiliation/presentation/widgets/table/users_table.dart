import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/config/utils/functions.dart';
import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:afiliados_app/features/auth/presentation/presentation.dart';
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
    final sortState = ref.watch(sortUserProvider);
    
    List<User> sortedUsers = List.from(users);

    switch (sortState.columnIndex) {
      /// nombre
      case 1:
        sortedUsers.sort((a, b) => sortState.ascending
            ? a.firstName.compareTo(b.firstName)
            : b.firstName.compareTo(a.firstName));
        break;

      /// apellido
      case 2:
        sortedUsers.sort((a, b) => sortState.ascending
            ? a.lastName.compareTo(b.lastName)
            : b.lastName.compareTo(a.lastName));
        break;

      /// cedula
      case 3:
        sortedUsers.sort((a, b) {
          int nationalIdA = int.tryParse(a.nationalId) ?? 0;
          int nationalIdB = int.tryParse(b.nationalId) ?? 0;
          return sortState.ascending
              ? nationalIdA.compareTo(nationalIdB)
              : nationalIdB.compareTo(nationalIdA);
        });
        break;

      /// tipo de usuario
      case 4:
        sortedUsers.sort((a, b) => sortState.ascending
            ? a.isDoctor.toString().compareTo(b.isDoctor.toString())
            : b.isDoctor.toString().compareTo(a.isDoctor.toString()));
        break;

      /// monto facturado
      case 5:
        sortedUsers.sort((a, b) => sortState.ascending
            ? a.historial
                .fold(0, (sum, item) => sum + item.amount.round())
                .compareTo(
                    b.historial.fold(0, (sum, item) => sum + item.amount))
            : b.historial
                .fold(0, (sum, item) => sum + item.amount.round())
                .compareTo(
                    a.historial.fold(0, (sum, item) => sum + item.amount)));
        break;
    }

    return Expanded(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,

          /// table of users
          child: DataTable(
              sortColumnIndex: sortState.columnIndex,
              sortAscending: sortState.ascending,
              columnSpacing: size.width * 0.03,
              border: TableBorder.symmetric(
                outside: BorderSide(
                  color: colors.onSurface,
                ),
                inside: BorderSide(color: colors.onSurface),
                borderRadius: BorderRadius.circular(8),
              ),

              /// column of table
              columns: [
                const DataColumn(label: Text('')),
                DataColumn(
                    tooltip: 'Ordernar por nombre',
                    onSort: (columnIndex, ascending) {
                      ref.read(sortUserProvider.notifier).sort(columnIndex);
                    },
                    label: const Text(
                      'Nombre ',
                      overflow: TextOverflow.ellipsis,
                    )),
                DataColumn(
                    tooltip: 'Ordernar por apellido',
                    onSort: (columnIndex, ascending) {
                      ref.read(sortUserProvider.notifier).sort(columnIndex);
                    },
                    label: const Text(
                      'Apellido ',
                      overflow: TextOverflow.ellipsis,
                    )),
                DataColumn(
                    tooltip: 'Ordenar por cédula',
                    onSort: (columnIndex, ascending) {
                      ref.read(sortUserProvider.notifier).sort(columnIndex);
                    },
                    label: const Text(
                      'Cédula ',
                      overflow: TextOverflow.ellipsis,
                    )),
                DataColumn(
                    tooltip: 'Ordernar por tipo de usuario',
                    onSort: (columnIndex, ascending) {
                      ref.read(sortUserProvider.notifier).sort(columnIndex);
                    },
                    label: const Text(
                      'Tipo de usuario ',
                      overflow: TextOverflow.ellipsis,
                    )),
                DataColumn(
                    tooltip: 'Ordernar por monto facturado',
                    onSort: (columnIndex, ascending) {
                      ref.read(sortUserProvider.notifier).sort(columnIndex);
                    },
                    label: const Text(
                      'Monto facturado ',
                      overflow: TextOverflow.ellipsis,
                    )),
                const DataColumn(
                    label: Text('Descuento', overflow: TextOverflow.ellipsis)),
                const DataColumn(label: Text('')),
              ],
              rows: [
                ...sortedUsers.map((user) => _customDataRow(user, context, ref))
              ]),
        ),
      ),
    );
  }

  DataRow _customDataRow(User user, BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(authProvider).authStatus;
    return DataRow(cells: [
      DataCell(
        Tooltip(
          message: 'Registro del usuario',
          child: IconButton(
              onPressed: () {
                ref.read(searchDelegateProvider.notifier).clearInput();
                context.push('/user/${user.id}');
              },
              icon: const Icon(
                Icons.file_open_rounded,
              )),
        ),
      ),
      DataCell(Text(Formatters.firstLetterToUpper(user.firstName))),
      DataCell(Text(Formatters.firstLetterToUpper(user.lastName))),
      DataCell(Text(Formatters.formatNationalId(user.nationalId))),
      DataCell((Text(user.isDoctor ? 'Medico' : 'Usuario'))),
      DataCell(Text('${Formatters.totalAmount(user.historial.toList())}')),
       DataCell(Text('${Functions.discountFormat(user.historial.toList())}\$')),
      DataCell(Row(
        children: [
          Tooltip(
            message: 'Agregar nuevo registro',
            child: IconButton(
                onPressed: () {
                  Functions.showModal(context, NewHistorialDialog(user: user));
                },
                icon: const Icon(
                  Icons.note_add,
                  color: Colors.green,
                )),
          ),
          if( authStatus == AuthStatus.authenticated )
          Tooltip(
            message: 'Eliminar usuario',
            child: IconButton(
                onPressed: () {
                  Functions.showModal(
                      context,
                      DeleteDialog(
                        firstName:
                            'a ${Formatters.firstLetterToUpper(user.firstName)}',
                        callback: () => ref
                            .read(usersProvider.notifier)
                            .deleteUser(user.id ?? 0),
                      ));
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ),
        ],
      )),
    ]);
  }
}
