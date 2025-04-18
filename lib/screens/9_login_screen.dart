import 'package:flutter/material.dart';
import 'package:flutter_lv2_go_router/layout/default_layout.dart';
import 'package:flutter_lv2_go_router/route/router.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('Login State : $isAuth'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isAuth = !isAuth;
              });
            },
            child: Text(isAuth ? 'Logout' : 'Login'),
          ),
          ElevatedButton(
            onPressed: () {
              if (GoRouterState.of(context).uri.path == '/login') {
                context.go('/login/private');
              } else {
                context.go('/login_2/private');
              }
            },
            child: const Text('Go PrivateScreen'),
          ),
        ],
      ),
    );
  }
}
