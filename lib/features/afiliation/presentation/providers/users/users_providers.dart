import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


  final usersStreamProvider = StreamProvider<List<User>>((ref) async* {
    final query = ref.watch(searchDelegateProvider).query;
    final users = ref.watch(userRepositoryProvider).getUsers(query);
    await for ( final user in users ){
      yield user;
    }

  });

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
      required double amount,
      required bool isDoctor}) async {
    final newUser =      User(firstName: firstName, lastName: lastName, isDoctor: isDoctor);
    final newHistorial = UserHistorial(date: DateTime.now(), amount: amount);
    await userRepository.addNewUser(newUser, newHistorial);
  }

  Future<void> deleteUser( int userId ) async {
    await userRepository.deleteUser(userId);
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
