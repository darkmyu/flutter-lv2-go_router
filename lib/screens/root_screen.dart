import 'package:flutter/material.dart';
import 'package:flutter_lv2_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/basic');
            },
            child: const Text('Go BasicScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed('named_screen');
            },
            child: const Text('Go NamedScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/push');
            },
            child: const Text('Go PushScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/pop');
            },
            child: const Text('Go PopBaseScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/path_param/123');
            },
            child: const Text('Go PathParamScreen'),
          ),
        ],
      ),
    );
  }
}
