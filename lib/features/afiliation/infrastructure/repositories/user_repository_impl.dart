


import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import '../infrastructure.dart';

class UserRepositoryImpl implements UserRepository{

  final UserDatasource datasource;

  UserRepositoryImpl({UserDatasource? datasource}):datasource = datasource ?? UserDatasourceImpl();

  @override
  Future<void> addNewUser(User user, UserHistorial historial) {
    return datasource.addNewUser(user, historial);
  }

  @override
  Future<void> deleteUser(int userId) {
    return datasource.deleteUser(userId);
  }

  @override
  Future<User> getUser(int userId) {
    return datasource.getUser(userId);
  }

  @override
  Stream<List<User>> getUsers([String query = '']) async*{
    yield* datasource.getUsers(query);
  }

  @override
  Future<void> updateUser(User user) {
    return datasource.updateUser(user);
  }
  
  @override
  Future<void> addNewHistorial(int userId, UserHistorial historial) {
    return datasource.addNewHistorial(userId, historial);
  }
}