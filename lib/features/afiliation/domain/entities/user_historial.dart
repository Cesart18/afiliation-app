// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:isar/isar.dart';

import '../domain.dart';

part 'user_historial.g.dart';

@collection
class UserHistorial {

  Id? id;
  DateTime? date;
  double? amount;
  @Index(unique: true)
  String? billNumber;
  @Backlink(to: 'historial')
  final user = IsarLink<User>();

  UserHistorial({
    this.id,
    this.date,
    this.amount,
    this.billNumber,
  });


  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date?.millisecondsSinceEpoch,
      'amount': amount,
      'billNumber': billNumber,
    };
  }

  factory UserHistorial.fromMap(Map<String, dynamic> map) {
    return UserHistorial(
      id: map['id'] != null ? map['id'] as int : null,
      date: map['date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int) : null,
      amount: map['amount'] != null ? map['amount'] as double : null,
      billNumber: map['billNumber'] != null ? map['billNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserHistorial.fromJson(String source) => UserHistorial.fromMap(json.decode(source) as Map<String, dynamic>);
}
