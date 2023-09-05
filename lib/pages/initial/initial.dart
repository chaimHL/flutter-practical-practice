import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_galaxy/common/rpx.dart';
import 'package:food_galaxy/pages/favor/favor.dart';
import 'package:food_galaxy/pages/filter/filter.dart';
import 'package:food_galaxy/pages/home/home.dart';
import 'package:food_galaxy/pages/initial/drawer.dart';
import 'package:image_picker/image_picker.dart';

class QYInitialPage extends StatefulWidget {
  static const String routeName = '/';

  const QYInitialPage({super.key});

  @override
  State<QYInitialPage> createState() => _QYInitialPageState();
}

class _QYInitialPageState extends State<QYInitialPage> {
  int _currentIndex = 0;
  XFile? _avatarImg; // 头像图片

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [QYHomePage(), QYFavorPage()],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
      drawer: QYDrawer(),
    );
  }

  // 底部导航
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
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
    );
  }
}
