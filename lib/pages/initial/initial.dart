import 'package:flutter/material.dart';
import 'package:food_galaxy/pages/favor/favor.dart';
import 'package:food_galaxy/pages/home/home.dart';

class QYInitialPage extends StatefulWidget {
  static const String routeName = '/';

  const QYInitialPage({super.key});

  @override
  State<QYInitialPage> createState() => _QYInitialPageState();
}

class _QYInitialPageState extends State<QYInitialPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [QYHomePage(), QYFavorPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: '收藏')
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
