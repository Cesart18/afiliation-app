// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

import '../domain.dart';

part 'user.g.dart';

@collection
class User {

  Id? id;
  String? firstName;
  String? lastName;
  bool? isDoctor;
  @Index(unique: true)
  String? nationalId;
  final historial = IsarLinks<UserHistorial>();

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.isDoctor,
    this.nationalId,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'isDoctor': isDoctor,
      'nationalId': nationalId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      isDoctor: map['isDoctor'] != null ? map['isDoctor'] as bool : null,
      nationalId: map['nationalId'] != null ? map['nationalId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
