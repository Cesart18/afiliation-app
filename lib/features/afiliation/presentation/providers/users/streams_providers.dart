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

final historialStreamProvider = StreamProvider.family<List<UserHistorial>, int>((ref, userId) async* {
    final query = ref.watch(searchDelegateProvider).query;
    final historialQ = ref.watch(userRepositoryProvider).getHistorial(userId, query);
    await for ( final historial in historialQ ){
      yield historial;
    }
  });