


import 'package:afiliados_app/features/afiliation/domain/domain.dart';

abstract class UserRepository {

  Future<void> addNewUser( User user );
  Future<void> updateUser( User user );
  Future<void> deleteUser( int userId );
  Future<User> getUser( int userId );
  Stream<List<User>> getUsers([ String query = '' ]);

} 