import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:afiliados_app/features/afiliation/presentation/widgets/table/user_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserScreen extends ConsumerWidget {
  final String id;
  const UserScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final user = ref.watch(userProvider(id)).user;
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        shadowColor: colors.surface,
        surfaceTintColor: colors.surface,
        title: Text(user?.firstName ?? 'No hay usuario'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            NewRegistryWidget(),
            const SizedBox(height: 50,),
            UserTable(user: user)

          ],
        ),
      )
    );
  }
}



  

