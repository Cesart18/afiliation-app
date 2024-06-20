


import 'package:afiliados_app/config/config.dart';
import 'package:afiliados_app/features/auth/presentation/presentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';

final appRouterProvider = Provider( (ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);
  return GoRouter(
  initialLocation: '/',
  refreshListenable: goRouterNotifier,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),),
    GoRoute(
      path: '/user/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '0';
        return UserScreen(id: id);
      }),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const LoginScreen()),
  ],
    redirect: (context, state) {
      final isGoingTo = state.fullPath;
      final authStatus = goRouterNotifier.authStatus;

      if ( authStatus == AuthStatus.notAuthenticated || authStatus == AuthStatus.checking){
        if ( isGoingTo == '/' || isGoingTo == '/auth') return null;
      }

      if ( authStatus == AuthStatus.authenticated ){
        if ( isGoingTo == '/auth' ) return '/';
      }

      return null;
    },);
});