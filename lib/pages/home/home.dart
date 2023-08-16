import 'package:flutter/material.dart';

import 'home_body.dart';

class QYHomePage extends StatelessWidget {
  const QYHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食荟萃'),
      ),
      body: QYHomeBody(),
    );
  }
}
