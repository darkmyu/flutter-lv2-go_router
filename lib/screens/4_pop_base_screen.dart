import 'package:flutter/material.dart';
import 'package:flutter_lv2_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PopBaseScreen extends StatelessWidget {
  const PopBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () async {
              final result = await context.push<String>('/pop/return');

              print(result);
            },
            child: const Text('Push PopReturnScreen'),
          ),
        ],
      ),
    );
  }
}
