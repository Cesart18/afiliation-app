import '../domain.dart';


abstract class AuthDatasource {

  Future<UserAdmin> login( String username, String password );

}