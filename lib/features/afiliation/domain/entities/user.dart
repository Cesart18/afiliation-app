import 'package:isar/isar.dart';
import '../domain.dart';

part 'user.g.dart';

@collection
class User {

  // TODO: conseguir la forma de que el indice aqui sea la combinacion de nombre y apellido
  Id? id;
  final String firstName;
  final String lastName;

  final historial = IsarLinks<UserHistorial>();

  final bool isDoctor;

  User(
      {required this.firstName,
      required this.lastName,
      required this.isDoctor});
}
