import 'package:afiliados_app/features/auth/domain/domain.dart';
import 'package:afiliados_app/features/auth/infrastructure/infrasctructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>( (ref) => AuthRepositoryImpl());