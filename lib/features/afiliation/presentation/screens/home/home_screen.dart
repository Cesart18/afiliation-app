import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    final isDarkmode = ref.watch(appThemeProvider);
    final colors = Theme.of(context).colorScheme;
    return Scaffold(

      /// Appbar
      appBar: AppBar(
        // backgroundColor: colors.primary ,
        elevation: 8,
        shadowColor: colors.surface,
        surfaceTintColor: colors.surface,
        actions: [

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
              NewAfiliationWidget(),
          
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