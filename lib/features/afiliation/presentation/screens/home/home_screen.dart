import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:afiliados_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    final isDarkmode = ref.watch(appThemeProvider);
    final colors = Theme.of(context).colorScheme;
    final authStatus = ref.watch(authProvider).authStatus;
    ref.listen(usersProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
    Future.delayed(const Duration(milliseconds: 100));
      Functions.showSnackbar(context, next.errorMessage);
    });

    return Scaffold(

      /// Appbar
      appBar: AppBar(
        // backgroundColor: colors.primary ,
        elevation: 8,
        shadowColor: colors.surface,
        surfaceTintColor: colors.surface,
        actions: [
          if( authStatus == AuthStatus.authenticated )
          Tooltip(
            message: 'Cerrar sesion',
            child: IconButton(onPressed: (){
              ref.read(authProvider.notifier).logout();
            }, icon: Icon(  Icons.logout ,
            color: colors.onSurface,)),
          ),
          const SizedBox(width: 20,),
          /// auth screen
          Badge(
            smallSize: 12,
            backgroundColor: Colors.green,
            isLabelVisible: ( authStatus == AuthStatus.authenticated ),
            child: Tooltip(
              message:  ( authStatus == AuthStatus.authenticated ) ? 'Autenticado' :'Autenticarse',
              child: IconButton(onPressed: (){
                context.go('/auth');
              }, icon: Icon(  Icons.lock ,
              color: colors.onSurface,)),
            ),
          ),
          const SizedBox(width: 20,),
        /// Toggle theme icon
          Tooltip(
            message: 'Cambiar tema',
            child: IconButton(onPressed: (){
              ref.read(appThemeProvider.notifier).update((state) => !state);
            }, icon: Icon( isDarkmode ? Icons.light_mode_sharp : Icons.brightness_2  ,
            color: colors.onSurface,)),
          ),
          const SizedBox(width: 20,),
        ],
      ),
      body:  const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
          
              SizedBox(height: 50,),       
              /// new afiliation
              NewUserWidget(),
          
              SizedBox(height: 50,),
              /// search input       
              SearchDelegateInput(),
          
              SizedBox(height: 50,),
              /// table user
              UsersTable(),
          
              SizedBox(height: 50,),
          
            ],
          ),
        ),
      ),
    );
  }
}