
import 'package:isar/isar.dart';
import '../domain.dart';

part 'user_historial.g.dart';

@collection
class UserHistorial{

  Id? id;
  final DateTime date;
  final double amount;

  @Backlink(to: 'historial')
  final user = IsarLink<User>();

  UserHistorial({required this.date, required this.amount});

}