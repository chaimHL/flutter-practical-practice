import 'package:flutter/material.dart';
import 'package:food_galaxy/common/rpx.dart';
import 'package:food_galaxy/pages/favor/favor.dart';
import 'package:food_galaxy/pages/filter/filter.dart';
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
      bottomNavigationBar: buildBottomNavigationBar(),
      drawer: buildDrawer(context),
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

  // 侧边抽屉
  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buildDrawerTop(context),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              '过滤',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            onTap: () {
              // 弹出过滤页面
              Navigator.of(context).pushNamed(QYFilterPage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.close),
            title: Text(
              '关闭',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  // 侧边抽屉头部
  Container buildDrawerTop(BuildContext context) {
    return Container(
      height: 300.rpx,
      alignment: Alignment(0, 0.5),
      color: Colors.amber,
      margin: EdgeInsets.only(bottom: 20.rpx),
      child: Text(
        '我是头部标题',
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
