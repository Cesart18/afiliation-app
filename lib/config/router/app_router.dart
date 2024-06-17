


import 'package:go_router/go_router.dart';
import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),)
  ]);