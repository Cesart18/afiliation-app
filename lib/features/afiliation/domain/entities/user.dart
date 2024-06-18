import 'package:isar/isar.dart';
import '../domain.dart';

part 'user.g.dart';

@collection
class User {

  Id? id;
  final String firstName;
  final String lastName;

  final historial = IsarLinks<UserHistorial>();

  final bool isDoctor;
  final int discount;

  User(
      {required this.firstName,
      required this.lastName,
      required this.isDoctor,
      required this.discount});
}
