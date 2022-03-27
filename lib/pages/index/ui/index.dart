import 'package:flutter/material.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/index/provider/index_provider.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<IndexProvider>(
      model: IndexProvider(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            drawer: Drawer(),
          ),
        );
      },
    );
  }
}
