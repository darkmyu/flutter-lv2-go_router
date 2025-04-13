import 'package:flutter_lv2_go_router/screens/1_basic_screen.dart';
import 'package:flutter_lv2_go_router/screens/2_named_screen.dart';
import 'package:flutter_lv2_go_router/screens/3_push_screen.dart';
import 'package:flutter_lv2_go_router/screens/4_pop_base_screen.dart';
import 'package:flutter_lv2_go_router/screens/5_pop_return_screen.dart';
import 'package:flutter_lv2_go_router/screens/6_path_param_screen.dart';
import 'package:flutter_lv2_go_router/screens/7_query_param_screen.dart';
import 'package:flutter_lv2_go_router/screens/8_nested_child_screen.dart';
import 'package:flutter_lv2_go_router/screens/8_nested_screen.dart';
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
        GoRoute(
          path: 'push',
          builder: (context, state) => const PushScreen(),
        ),
        GoRoute(
          path: 'pop',
          builder: (context, state) => const PopBaseScreen(),
          routes: [
            GoRoute(
              path: 'return',
              builder: (context, state) => const PopReturnScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'path_param/:id',
          builder: (context, state) => const PathParamScreen(),
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) => const PathParamScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) => const QueryParamsScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) => NestedScreen(
            child: child,
          ),
          routes: [
            GoRoute(
              path: 'nested/a',
              builder: (context, state) => const NestedChildScreen(
                routeName: '/nested/a',
              ),
            ),
            GoRoute(
              path: 'nested/b',
              builder: (context, state) => const NestedChildScreen(
                routeName: '/nested/b',
              ),
            ),
            GoRoute(
              path: 'nested/c',
              builder: (context, state) => const NestedChildScreen(
                routeName: '/nested/c',
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
