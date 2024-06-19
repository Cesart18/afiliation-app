import 'package:isar/isar.dart';
import '../domain.dart';

part 'user.g.dart';

@collection
class User {

  Id? id;
  late String firstName;
  late String lastName;
  late bool isDoctor;
  @Index(unique: true)
  late String nationalId;
  final historial = IsarLinks<UserHistorial>();

}
