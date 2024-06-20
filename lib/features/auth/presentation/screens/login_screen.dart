import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/auth/presentation/presentation.dart';
import 'package:afiliados_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context, ref) {
    final loginForm = ref.watch(loginFormProvider);
    final loginFormRead = ref.read(loginFormProvider.notifier);
    final bool obscureText = ref.watch(loginFormProvider).obscureText;
    final size = MediaQuery.of(context).size;
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    final colors = Theme.of(context).colorScheme;
  ref.listen(authProvider, (previous, next){
    if( next.errorMessage.isEmpty ) return;
    Future.delayed(const Duration(milliseconds: 100));
      Functions.showSnackbar(context, next.errorMessage);
  });

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: size.width*0.5,
          height: size.height*0.4,
          constraints: const BoxConstraints(
            maxWidth: 500,
            maxHeight: 500,
            minHeight: 300,
            minWidth: 300
          ),
          decoration: BoxDecoration(
          border: Border.all(color: colors.onSurface),
          borderRadius: BorderRadius.circular(4)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          // TITULO
            children: [
               Text('Iniciar sesión',
              style: titleLarge,),
              const SizedBox(height: 20,),
        
              // USER
               CustomTextFormField(
                hintText: 'Usuario',
                keyboardType: TextInputType.text,
                maxLength: 20,
                errorMessage:  loginForm.isFormPosted ?  loginForm.username.errorMessage : null,
                onChanged: loginFormRead.onUsernameChanged,
                onFieldSubmitted: (_)=> loginFormRead.onFormSubmit(),
                
              ),
              // PASSWORD
              const SizedBox(height: 20,),
               CustomTextFormField(
                maxLength: 64,
                hintText: 'Contraseña',
                keyboardType: TextInputType.text,
                obscureText: !obscureText,
                errorMessage: loginForm.isFormPosted ? loginForm.password.errorMessage : null,
                onChanged: loginFormRead.onPasswordChanged,
                onFieldSubmitted: (_)=> loginFormRead.onFormSubmit(),
                suffixIcon: IconButton(onPressed: (){
                  ref.read(loginFormProvider.notifier).showPassword();
                }, icon:  Icon( obscureText? Icons.visibility : Icons.visibility_off)),
              ),
              const SizedBox(height: 40,),
              // BUTTON
              CustomAuthButton(text: 'Ingresar', onPressed: (){
                loginFormRead.onFormSubmit();
              }),
              const SizedBox(height: 40,),
              CustomAuthButton(
                text: 'Cancelar', onPressed: (){
                context.push('/');
              },
              bgColor: colors.error,)
            ],
          ),
        ),
      ),
    );
  }
}