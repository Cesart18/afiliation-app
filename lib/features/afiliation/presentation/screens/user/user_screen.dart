import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';

class UserScreen extends ConsumerWidget {
  final String id;
  const UserScreen({super.key, required this.id});

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final user = ref.watch(userProvider(id)).user;
    final historialAsync = ref.watch(historialStreamProvider(int.tryParse(id) ?? 0));

    ref.listen(usersProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
    Future.delayed(const Duration(milliseconds: 100));
      showSnackbar(context, next.errorMessage);
    });

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        ref.read(userFormInputProvider.notifier).clearControllers();
        ref.read(searchDelegateProvider.notifier).clearInput();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 8,
          shadowColor: colors.surface,
          surfaceTintColor: colors.surface,
          title: Text('Registro de ${Formatters.firstLetterToUpper(user?.firstName ?? 'No hay usuario')}'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              NewHistorialWidget(user: user,),
              const SizedBox(height: 50,),
              const SearchDelegateInput(),
              const SizedBox(height: 50,),
              historialAsync.when(
                data: (historial) => UserTable(historial: historial, userId: int.tryParse(id) ?? 0),
                 error: (error, stackTrace) => Text('$error'),
                  loading: () => const CircularProgressIndicator())
      
            ],
          ),
        )
      ),
    );
  }
}




  

