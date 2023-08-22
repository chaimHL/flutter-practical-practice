import 'package:flutter/material.dart';
import 'package:food_galaxy/pages/favor/favor_body.dart';

class QYFavorPage extends StatelessWidget {
  const QYFavorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('收藏'),
      ),
      body: QYFavorBody(),
    );
  }
}
