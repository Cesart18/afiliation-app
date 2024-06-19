


import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:isar/isar.dart';

class UserDatasourceImpl implements UserDatasource{

  late Future<Isar> db;
  UserDatasourceImpl(){
    db = IsarService().db;
  }

  @override
  Future<void> addNewUser(User user, UserHistorial historial) async{

    final newUser = user
    ..historial.add(historial);

    final isar = await db;
    await isar.writeTxn(() async{
      await isar.users.put(newUser);
      await isar.userHistorials.put(historial);
      await user.historial.save();
    });
  }

  @override
  Future<void> deleteUser(int userId) async {
    final isar = await db;
    
    await isar.writeTxn(() async{
      await isar.userHistorials.filter().user((user) => user.idEqualTo(userId)).deleteAll();
      await isar.users.filter().idEqualTo(userId).deleteFirst();
    });
  }

  @override
  Future<User> getUser(int userId) async {
    final isar = await db;
    
    final user = await isar.users.where().idEqualTo(userId).findFirst();
      return Future.value(user);

  }

  @override
  Stream<List<User>> getUsers([String query = '']) async* {
  try {
    final isar = await db;
    final usersQ = query.isEmpty 
        ? isar.users.where().watch(fireImmediately: true) 
        : isar.users.filter().firstNameStartsWith(query).or().lastNameStartsWith(query).watch(fireImmediately: true);

      yield* usersQ;
  } catch (e) {
    // print('Error fetching users: $e');
    yield [];
  }
}


  @override
  Future<void> updateUser(User updatedUser) async {
    final isar = await db;
      await isar.writeTxn(() async{
      User? user = await isar.users.get(updatedUser.id!);
      user = updatedUser;
      await isar.users.put(user);
    });
    
  }
  
  @override
  Future<void> addNewHistorial(int userId, UserHistorial historial) async{
    final isar = await db;
    
    final user = await isar.users.get(userId)
    ?..historial.add(historial);

    await isar.writeTxn(() async{
      await isar.userHistorials.put(historial);
      await user?.historial.save();
    });

    // final prueba = await isar.userHistorials.filter().user((user)=> user.idEqualTo(userId)).watch();
    
// TODO: manejar los errores
    
  }
 

}