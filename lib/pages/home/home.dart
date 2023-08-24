import 'package:flutter/material.dart';

import 'home_body.dart';

class QYHomePage extends StatelessWidget {
  const QYHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食荟萃'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // 打开定义于 lib/pages/initial/initial.dart 的侧边抽屉
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: QYHomeBody(),
      drawer: Drawer(),
    );
  }
}
