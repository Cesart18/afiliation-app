import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';

class UserScreen extends ConsumerWidget {
  final String id;
  const UserScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final user = ref.watch(userProvider(id)).user;
    final historialAsync = user?.historial.filter().watch(fireImmediately: true);
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) => ref.read(userFormInputProvider.notifier).clearControllers(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 8,
          shadowColor: colors.surface,
          surfaceTintColor: colors.surface,
          title: Text('Registro de ${TextFormatter.firstLetterToUpper(user?.firstName ?? 'No hay usuario')}'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              NewRegistryWidget(user: user,),
              const SizedBox(height: 50,),
              StreamBuilder(stream: historialAsync, builder: (context, snapshot) {
                if( snapshot.hasData ){
                  return UserTable(historial: snapshot.data!.toList());
                }
                return const CircularProgressIndicator();
              },)
      
            ],
          ),
        )
      ),
    );
  }
}




  

