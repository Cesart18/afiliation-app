


import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:isar/isar.dart';

class UserDatasourceImpl implements UserDatasource{

  late Future<Isar> db;
  UserDatasourceImpl(){
    db = IsarService().db;
  }

  @override
  Future<void> addNewUser(User user) async{
    final isar = await db;
    await isar.writeTxn(() async{
      await isar.users.put(user);
    });
  }

  @override
  Future<void> deleteUser(int userId) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<User> getUser(int userId) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Stream<List<User>> getUsers([String query = '']) {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

}