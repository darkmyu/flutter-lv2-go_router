import 'package:flutter/material.dart';
import 'package:flutter_lv2_go_router/screens/10_transition_screen_1.dart';
import 'package:flutter_lv2_go_router/screens/10_transition_screen_2.dart';
import 'package:flutter_lv2_go_router/screens/1_basic_screen.dart';
import 'package:flutter_lv2_go_router/screens/2_named_screen.dart';
import 'package:flutter_lv2_go_router/screens/3_push_screen.dart';
import 'package:flutter_lv2_go_router/screens/4_pop_base_screen.dart';
import 'package:flutter_lv2_go_router/screens/5_pop_return_screen.dart';
import 'package:flutter_lv2_go_router/screens/6_path_param_screen.dart';
import 'package:flutter_lv2_go_router/screens/7_query_param_screen.dart';
import 'package:flutter_lv2_go_router/screens/8_nested_child_screen.dart';
import 'package:flutter_lv2_go_router/screens/8_nested_screen.dart';
import 'package:flutter_lv2_go_router/screens/9_login_screen.dart';
import 'package:flutter_lv2_go_router/screens/9_private_screen.dart';
import 'package:flutter_lv2_go_router/screens/root_screen.dart';
import 'package:go_router/go_router.dart';

bool isAuth = false;

final router = GoRouter(
  redirect: (context, state) {
    if (state.uri.path == '/login/private' && !isAuth) {
      return '/login';
    }

    return null;
  },
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
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) => const PrivateScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'login_2',
          builder: (context, state) => const LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) => const PrivateScreen(),
              redirect: (context, state) {
                if (!isAuth) {
                  return '/login_2';
                }

                return null;
              },
            ),
          ],
        ),
        GoRoute(
          path: 'transition',
          builder: (context, state) => const TransitionScreenOne(),
          routes: [
            GoRoute(
              path: 'detail',
              pageBuilder: (context, state) => CustomTransitionPage(
                child: const TransitionScreenTwo(),
                transitionDuration: const Duration(seconds: 3),
                transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
                // transitionsBuilder: (context, animation, secondaryAnimation, child) => ScaleTransition(
                //   scale: animation,
                //   child: child,
                // ),
                // transitionsBuilder: (context, animation, secondaryAnimation, child) => RotationTransition(
                //   turns: animation,
                //   child: child,
                // ),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
