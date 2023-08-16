import 'package:flutter/material.dart';

class QYFavorPage extends StatelessWidget {
  const QYFavorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('收藏'),
      ),
      body: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.yellow.withOpacity(0.5), Colors.yellow]),
          border: Border.all(width: 4, color: Colors.black12), // 边框
          borderRadius: BorderRadius.circular(20), // 圆角
          boxShadow: [
            BoxShadow(
              color: Colors.orange,
              offset: Offset(10, 10),
              blurRadius: 10,
            )
          ], // 阴影
        ),
        child: Text(
          'Hello',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
