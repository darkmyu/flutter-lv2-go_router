import 'package:flutter/material.dart';
import 'package:flutter_lv2_go_router/layout/default_layout.dart';

class NamedScreen extends StatelessWidget {
  const NamedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      body: Text('Named Screen'),
    );
  }
}
