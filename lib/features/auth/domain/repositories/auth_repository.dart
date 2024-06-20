import '../domain.dart';


abstract class AuthRepository {

  Future<UserAdmin> login( String username, String password );

}