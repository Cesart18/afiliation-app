import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:afiliados_app/features/afiliation/infrastructure/infrastructure.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final usersProvider = StateNotifierProvider<UsersNotifier,UsersState>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return UsersNotifier(userRepository: userRepository);
});

class UsersNotifier extends StateNotifier<UsersState> {
  final UserRepository userRepository;
  UsersNotifier({required this.userRepository}) : super(UsersState());

  Future<void> createNewUser({
      required String firstName,
      required String lastName,
      required int nationalId,
      required double amount,
      required bool isDoctor,
      required int billNumber,
      required Function() callback,
      }
      ) async {

    try {
        final newUser =      User()..firstName = firstName..lastName = lastName..nationalId = '$nationalId'..isDoctor = isDoctor;
            final newHistorial = UserHistorial()..amount = amount..date = DateTime.now()..billNumber = '$billNumber';
            await userRepository.addNewUser(newUser, newHistorial);
      callback();
      _onDone();
    } on CustomError catch (e) {
      _onGetError(e.message);
    }catch (e){
      _onGetError( 'Error no controlado' );
    }
    
  }

  Future<void> deleteUser( int userId ) async {
    try {
      await userRepository.deleteUser(userId);
      _onDone();
    } on CustomError catch (e) {
      _onGetError(e.message);
    }catch (e){
      _onGetError( 'Error no controlado' );
    }
  }
  
  Future<void> addNewHistorial( int userId, UserHistorial historial, Function() callback ) async {
    try {
      await userRepository.addNewHistorial(userId, historial);
      _onDone();
      callback();
    } on CustomError catch (e) {
      _onGetError(e.message);
    }catch (e){
      _onGetError( 'Error no controlado' );
    }
  }

  Future<void> updateUser( User user ) async {
    try {
      await userRepository.updateUser(user);
      _onDone();
    } on CustomError catch (e) {
      _onGetError(e.message);
    }catch (e){
      _onGetError( 'Error no controlado' );
    }
  }

  Future<void> deleteHistorial( int userId, int historialId ) async {
    try {
      await userRepository.deleteHistorial(userId, historialId);
      _onDone();
    } on CustomError catch (e) {
      _onGetError(e.message);
    }catch (e){
      _onGetError( 'Error no controlado' );
    }
  }
  _onGetError([String value = '' ]){
    state = state.copyWith(
      errorMessage: value
    );
  }
  _onDone(){
    state = state.copyWith(
      errorMessage: ''
    );
  }
}

class UsersState {
  final String errorMessage;

  UsersState({this.errorMessage = ''});

  UsersState copyWith({
    String? errorMessage,
  }) =>
      UsersState(
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
