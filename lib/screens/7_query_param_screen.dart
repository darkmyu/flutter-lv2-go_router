import 'package:flutter/material.dart';
import 'package:flutter_lv2_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class QueryParamsScreen extends StatelessWidget {
  const QueryParamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('Query Params : ${GoRouterState.of(context).uri.queryParameters}'),
          ElevatedButton(
            onPressed: () {
              context.push(
                Uri(
                  path: '/query_param',
                  queryParameters: {
                    'name': 'codefactory',
                    'age': '32',
                  },
                ).toString(),
              );
            },
            child: const Text('Query Parameter'),
          ),
        ],
      ),
    );
  }
}
