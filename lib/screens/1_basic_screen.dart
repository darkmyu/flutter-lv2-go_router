import 'package:flutter/material.dart';
import 'package:flutter_lv2_go_router/layout/default_layout.dart';

class 11BasicScreen1BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      body: Center(
        child: Text('Basic Screen'),
      ),
    );
  }
}
