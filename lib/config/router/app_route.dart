import 'package:go_router/go_router.dart';
import 'package:hablandohuevadasf/presentation/presentation.dart';

final appRoutes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
