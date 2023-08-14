import 'package:flutter/material.dart';

class QYUnknownPage extends StatelessWidget {
  const QYUnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面不存在'),
      ),
      body: Center(
        child: Text('404'),
      ),
    );
  }
}
