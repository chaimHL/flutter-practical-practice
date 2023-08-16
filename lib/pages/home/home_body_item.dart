import 'package:flutter/material.dart';
import 'package:food_galaxy/common/rpx.dart';

import '../../model/category_model.dart';

class QYHomeBodyItem extends StatelessWidget {
  const QYHomeBodyItem(
    this.item, {
    super.key,
  });

  final QyCategoryItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.rpx),
        // 渐变色背景
        gradient: LinearGradient(
            colors: [item.actualColor.withOpacity(0.5), item.actualColor]),
      ),
      alignment: Alignment.center,
      child: Text(
        item.title,
        style: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
