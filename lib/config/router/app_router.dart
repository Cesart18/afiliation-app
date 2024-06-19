


import 'package:go_router/go_router.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';

final appRouter = GoRouter(
  initialLocation: '/',
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
  ]);