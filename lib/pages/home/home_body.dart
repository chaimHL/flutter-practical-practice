import 'package:flutter/material.dart';
import 'package:food_galaxy/common/rpx.dart';

import 'package:food_galaxy/services/json_parse.dart';

import 'home_body_item.dart';

class QYHomeBody extends StatelessWidget {
  const QYHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: QYJsonParse.getCategoryData(),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.error != null) {
          return Center(
            child: Text('请求出错'),
          );
        }

        final list = snapshot.data!;
        return GridView.builder(
          padding: EdgeInsets.all(20.rpx),
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.rpx,
            mainAxisSpacing: 20.rpx,
            childAspectRatio: 1.5, // 宽高比
          ),
          itemBuilder: (ctx, index) {
            return QYHomeBodyItem(list[index]);
          },
        );
      },
    );
  }
}
