import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_galaxy/common/rpx.dart';
import 'package:food_galaxy/model/meal_model.dart';
import 'package:food_galaxy/pages/meal_detail/meal_detail.dart';
import 'package:food_galaxy/widgets/icon_label.dart';

class QYMealItem extends StatelessWidget {
  QYMealItem(QyMealModel this._meal, {super.key});

  final QyMealModel _meal;
  final double _borderRadius = 12.rpx; // 圆角

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.only(
            left: 20.rpx, right: 20.rpx, top: 20.rpx, bottom: 10.rpx),
        elevation: 4.rpx, // 阴影
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius)), // 圆角
        child: Column(
          children: [buildItemTop(context), buildItemBottom()],
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(QYMealDetailPage.routeName, arguments: _meal);
      },
    );
  }

  // item 底部图片栏
  Padding buildItemBottom() {
    return Padding(
      padding: EdgeInsets.all(20.rpx),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          QYIconLabel(
            icon: Icon(Icons.access_time),
            label: '${_meal.duration}分钟',
          ),
          QYIconLabel(
            icon: Icon(Icons.restaurant),
            label: '${_meal.complexityStr}',
          ),
          QYIconLabel(
            icon: Icon(Icons.favorite_border),
            label: '未收藏',
          )
        ],
      ),
    );
  }

  // item 头部图片区域
  Stack buildItemTop(context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_borderRadius),
              topRight: Radius.circular(_borderRadius)),
          child: Image.network(
            _meal.imageUrl!,
            width: double.infinity,
            height: 480.rpx,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10.rpx,
          bottom: 20.rpx,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.rpx, horizontal: 20.rpx),
            decoration: BoxDecoration(color: Colors.black54),
            child: Text(
              _meal.title!,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
