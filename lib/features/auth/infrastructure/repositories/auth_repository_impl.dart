


import 'package:afiliados_app/features/auth/domain/domain.dart';
import 'package:afiliados_app/features/auth/infrastructure/infrasctructure.dart';

class AuthRepositoryImpl implements AuthRepository{

  final AuthDatasource datasource;

  AuthRepositoryImpl({AuthDatasource? datasource}):datasource = datasource ?? AuthDatasourceImpl();

  @override
  Future<UserAdmin> login(String username, String password) {
    return datasource.login(username, password);
  }
}