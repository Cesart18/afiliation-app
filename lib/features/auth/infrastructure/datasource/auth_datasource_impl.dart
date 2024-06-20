


import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/afiliation/infrastructure/infrastructure.dart';
import 'package:afiliados_app/features/auth/domain/domain.dart';
import 'package:isar/isar.dart';

class AuthDatasourceImpl implements AuthDatasource{

  late Future<Isar> db;
  AuthDatasourceImpl(){
    db = IsarService().db;
    _defaultUser();
  }

  _defaultUser() async {
    final isar = await db;
    final userAdmin = UserAdmin()
    ..userName = 'admin'
    ..password = 'admin123';
    
    final userIsAdded = await isar.writeTxn(() async {
      return await isar.userAdmins.where().findFirst();
    });
    if ( userIsAdded == null ){
      await isar.writeTxn(() async {
        await isar.userAdmins.put(userAdmin);
      });
    }

  }

  @override
  Future<UserAdmin> login(String username, String password) async {
    final isar = await db;

    try {
      final query = isar.userAdmins.where().filter().userNameEqualTo(username)
        .passwordEqualTo(password);
      final getUser = await query.findFirst();
      return Future.value(getUser);
    } on IsarError catch (_) {
      throw CustomError(message: 'Credenciales invalidas');
    } catch (e){
      throw CustomError(message: 'Credenciales invalidas');
    }

  }
}