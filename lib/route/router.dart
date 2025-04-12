import 'package:flutter_lv2_go_router/screens/root_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RootScreen(),
    ),
  ],
);
