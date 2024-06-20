


import 'package:afiliados_app/features/afiliation/domain/domain.dart';

abstract class UserRepository {

  Future<void> addNewUser( User user, UserHistorial historial );
  Future<void> updateUser( User user );
  Future<void> deleteUser( int userId );
  Future<User> getUser( int userId );
  Future<void> addNewHistorial( int userId , UserHistorial historial );
  Future<void> deleteHistorial( int userId, int historialId );
  Stream<List<User>> getUsers([ String query = '' ]);
  Stream<List<UserHistorial>> getHistorial( int userId, [ String query = '' ]);

} 