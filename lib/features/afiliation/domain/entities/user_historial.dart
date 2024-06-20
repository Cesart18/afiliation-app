
import 'package:isar/isar.dart';
import '../domain.dart';

part 'user_historial.g.dart';

@collection
class UserHistorial{

  Id? id;
  late DateTime date;
  late double amount;
  @Index(unique: true)
  late String billNumber;

  @Backlink(to: 'historial')
  final user = IsarLink<User>();

  // TODO: bloquear y agregar autenticacion
  // TODO: crear un modulo para cuando un cupon se usa
  // TODO: exportacion e importacion de la base datos 
  
}