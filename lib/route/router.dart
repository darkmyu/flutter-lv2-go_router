import 'package:flutter_lv2_go_router/screens/1_basic_screen.dart';
import 'package:flutter_lv2_go_router/screens/2_named_screen.dart';
import 'package:flutter_lv2_go_router/screens/root_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RootScreen(),
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) => const BasicScreen(),
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) => const NamedScreen(),
        ),
      ],
    ),
  ],
);
