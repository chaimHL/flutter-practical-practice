import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_galaxy/common/rpx.dart';
import 'package:food_galaxy/pages/battery/battery.dart';
import 'package:food_galaxy/store/profile_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../filter/filter.dart';

class QYDrawer extends StatefulWidget {
  const QYDrawer({super.key});

  @override
  State<QYDrawer> createState() => _QYDrawerState();
}

class _QYDrawerState extends State<QYDrawer> {
  @override
  Widget build(BuildContext context) {
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
            leading: Icon(Icons.battery_5_bar_sharp),
            title: Text(
              '电量',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            onTap: () {
              // 弹出过滤页面
              Navigator.of(context).pushNamed(QYBatteryPage.routeName);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<QYProfileStore>(
              builder: (context, value, child) {
                return GestureDetector(
                  child: CircleAvatar(
                    minRadius: 60.rpx,
                    backgroundImage: buildImage(),
                  ),
                  onTap: pickAvatar(value),
                );
              },
            ),
            SizedBox(
              height: 14.rpx,
            ),
            Text(
              'Chaim',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

// 处理头像
  ImageProvider buildImage() {
    final _avatarImg = Provider.of<QYProfileStore>(context).avatarImg?.path;
    if (_avatarImg == null) {
      return AssetImage('assets/images/placeholder.png'); // 从项目资源加载
    } else {
      return FileImage(File(_avatarImg)); // 从文件系统加载
    }
  }

// 点击头像
  pickAvatar(value) {
    return () async {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if (photo == null) return;
      value.avatarImg = photo;
    };
  }
}
