import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:afiliados_app/features/afiliation/domain/domain.dart';

final userProvider = StateNotifierProvider.autoDispose.family<UserNotifier, UserState, String>((ref, userId) {
  final userRepository = ref.watch(userRepositoryProvider);
  return UserNotifier(
    userRepository: userRepository,
    userId: int.parse(userId)
  );
});

class UserNotifier extends StateNotifier<UserState> {
  final int userId;
  final UserRepository userRepository;
  UserNotifier({
    required this.userId,
    required this.userRepository
  }): super(UserState(userId: userId)){
    getUser();
  }
  
  Future<void> getUser() async {
    final user = await userRepository.getUser(state.userId);
    state = state.copyWith(
      user: user
    );
  }


}

class UserState {
  final int userId;
  final User? user;

  UserState({
    required this.userId,
    this.user});

  UserState copyWith({
    int? userId,
    User? user,
  }) =>
      UserState(
        userId: userId ?? this.userId,
        user: user ?? this.user,
      );
}
