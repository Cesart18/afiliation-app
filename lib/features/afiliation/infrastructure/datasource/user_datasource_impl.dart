
import 'dart:io';

import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/afiliation/domain/domain.dart';
import 'package:afiliados_app/features/afiliation/infrastructure/infrastructure.dart';
import 'package:file_picker/file_picker.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class UserDatasourceImpl implements UserDatasource{

  late Future<Isar> db;
  UserDatasourceImpl(){
    db = IsarService().db;
  }

  @override
  Future<void> addNewUser(User user, UserHistorial historial) async{
    final newUser = user
    ..historial.add(historial);

    try {
      final isar = await db;
    await isar.writeTxn(() async{
      await isar.users.put(newUser);
      await isar.userHistorials.put(historial);
      await user.historial.save();
    });
    } on IsarError  catch (e) {
      if ( e.message == 'Unique index violated.' ){
        throw CustomError(message: 'Numero de cedula ya existe');
      }
    } catch (e){
      throw Exception();
    }
  }

  @override
  Future<void> deleteUser(int userId) async {
    final isar = await db;

    try {
    await isar.writeTxn(() async{
      await isar.userHistorials.filter().user((user) => user.idEqualTo(userId)).deleteAll();
      await isar.users.filter().idEqualTo(userId).deleteFirst();
    });
    } on IsarError  catch (e) {
      throw CustomError(message: e.message);
    } catch (e){
      throw Exception();
    }
    
  }
  @override
  Future<void> updateUser(User updatedUser) async {
    final isar = await db;

      try {
      await isar.writeTxn(() async{
      User? user = await isar.users.get(updatedUser.id ?? 0);
      user = updatedUser;
      await isar.users.put(user);
    }); 
      } on IsarError  catch (e) {
        if ( e.message == 'Unique index violated.' ){
        throw CustomError(message: 'Numero de cedula ya existe');
      }
      throw CustomError(message: e.message);
    } catch (e){
      throw Exception();
    }
  }

  @override
  Future<User> getUser(int userId) async {
    final isar = await db;
    
    try {
    final user = await isar.users.where().idEqualTo(userId).findFirst();
      return Future.value(user);
    } on IsarError  catch (e) {
      throw CustomError(message: e.message);
    } catch (e){
      throw Exception();
    }
  }

  @override
  Stream<List<User>> getUsers([String query = '']) async* {
  try {
    final isar = await db;
    final usersQ = query.isEmpty 
        ? isar.users.where().watch(fireImmediately: true) 
        : isar.users.filter().firstNameContains(query).or().lastNameContains(query).or().nationalIdStartsWith(query).watch(fireImmediately: true);

      yield* usersQ;
  } on IsarError  catch (e) {
      yield [];
      throw CustomError(message: e.message);
    } catch (e){
      throw Exception();
    }
}


  
  
  @override
  Future<void> addNewHistorial(int userId, UserHistorial historial) async{
    final isar = await db;
    try {
    final user = await isar.users.get(userId)
    ?..historial.add(historial);

    await isar.writeTxn(() async{
      await isar.userHistorials.put(historial);
      await user?.historial.save();
    });
    } on IsarError  catch (e) {
      if ( e.message == 'Unique index violated.' ){
        throw CustomError(message: 'Numero de factura ya existe');
      }
      throw CustomError(message: e.message);
    } catch (e){
      throw Exception();
    }
  }
  
  @override
  Future<void> deleteHistorial(int userId, int historialId) async{
    final isar = await db;
    try {
    await isar.writeTxn(() async {
      await isar.userHistorials.filter().user(( user ) => user.idEqualTo(userId)).idEqualTo(historialId).deleteFirst();
    });
    } on IsarError  catch (e) {
      throw CustomError(message: e.message);
    } catch (e){
      throw Exception();
    }
  }
  
  @override
  Stream<List<UserHistorial>> getHistorial( int userId ,[String query = '']) async*{
    try {
    final isar = await db;
    final historialQ = query.isEmpty 
        ? isar.userHistorials.filter().user((user) => user.idEqualTo(userId)).watch( fireImmediately: true )
        : isar.userHistorials.filter().user((user) => user.idEqualTo(userId)).billNumberStartsWith(query)
        .watch(fireImmediately: true);

      yield* historialQ;
  } on IsarError  catch (e) {
      yield [];
      throw CustomError(message: e.message);
    } catch (e){
      throw Exception();
    } 
  }
  
  @override
  Future<void> deleteAllHistorial(int userId) async {
    final isar = await db;

    try {
      await isar.writeTxn(() async {
        await isar.userHistorials.filter().user( (user) => user.idEqualTo(userId) ).deleteAll();
      });
    } catch (e) {
      throw CustomError(message: 'Error no controlado');
    }

  }
  
  @override
  Future<void> exportData() async {
  final isar = await db;
  final path = await FilePicker.platform.getDirectoryPath();
  final emptyFile = File(path!);
  try {
    await isar.copyToFile('${emptyFile.path}/default.isar');
  } on IsarError catch (e) {
    if( e.message == 'MdbxError (17): File exists' ){
    throw CustomError(message: 'Archivo ya existe');
    }
  }
}

  @override
  Future<void> importData() async {
    final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['isar'],
  );
  final dir = await getApplicationDocumentsDirectory();
  final path = '${dir.path}/default.isar';
  final file = File(path);

  if (await file.exists()) {
    await file.delete();
  } else {
    throw CustomError(message: 'No se pudo eliminar default.isar');
  }

  if (result != null && result.files.single.path != null) {
    final newPath = result.files.single.path!;
    final directory = await getApplicationDocumentsDirectory();
    final defaultPath = '${directory.path}/default.isar';

    final newFile = File(newPath);
    await newFile.copy(defaultPath);
    throw CustomError(message: 'Bd importada con exito');
  } else {
    throw CustomError(message: 'No se pudo realizar la accion');
  }

  }

}

