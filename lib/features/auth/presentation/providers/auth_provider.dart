import 'package:afiliados_app/features/afiliation/infrastructure/infrastructure.dart';
import 'package:afiliados_app/features/auth/presentation/presentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:afiliados_app/features/auth/domain/domain.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthNotifier(authRepository: authRepository);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  AuthNotifier({ required this.authRepository }): super(AuthState());

  Future<void>loginUser( String username , String password ) async {
      try {
        final user = await  authRepository.login(username, password);
        _setLoggedUser(user);
      } on CustomError catch (e) {
        logout(e.message);
      }catch (e){
      logout( 'Error no controlado' );
    }

  }


  _setLoggedUser( UserAdmin userAdmin ){
    state = state.copyWith(
      userAdmin: userAdmin,
      authStatus: AuthStatus.authenticated,
      errorMessage: ''
    );
  }

  Future<void> logout([ String? errorMessage ]) async {
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      userAdmin: null,
      errorMessage: errorMessage
    );
  }
  
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {

  final AuthStatus authStatus;
  final UserAdmin? userAdmin;
  final String errorMessage;

  AuthState({
     this.authStatus = AuthStatus.checking,
     this.userAdmin,
     this.errorMessage = '',
     });



  AuthState copyWith({
    AuthStatus? authStatus,
    UserAdmin? userAdmin,
    String? errorMessage,
  }) =>
     AuthState(
      authStatus: authStatus ?? this.authStatus,
      userAdmin: userAdmin ?? this.userAdmin,
      errorMessage: errorMessage ?? this.errorMessage,
    );
}
