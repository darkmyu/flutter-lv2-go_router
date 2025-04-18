import 'package:flutter/material.dart';
import 'package:flutter_lv2_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PushScreen extends StatelessWidget {
  const PushScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              // stack
              // push -> basic -> push
              context.push('/basic');
            },
            child: const Text('Push Basic'),
          ),
          ElevatedButton(
            onPressed: () {
              // stack
              // push -> basic -> root
              context.go('/basic');
            },
            child: const Text('Go Basic'),
          )
        ],
      ),
    );
  }
}
