import 'package:flutter/material.dart';
import 'package:food_galaxy/common/rpx.dart';
import 'package:food_galaxy/model/meal_model.dart';

class QYMealDetailBody extends StatelessWidget {
  const QYMealDetailBody(this._meal, {super.key});

  final QyMealModel _meal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBodyTop(),
          buildTitle(context, '制作材料'),
          buildBodyMid(context),
          buildTitle(context, '步骤'),
          buildBodyBottom(context),
          SizedBox(height: 40.rpx)
        ],
      ),
    );
  }

  // 头部图片
  Container buildBodyTop() {
    return Container(
      width: double.infinity,
      child: Image.network(
        _meal.imageUrl!,
        width: double.infinity,
        height: 480.rpx,
        fit: BoxFit.cover,
      ),
    );
  }

  // 标题
  Widget buildTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.all(40.rpx),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  // 白色带边框圆角矩形
  Widget buildWrap(BuildContext context, Widget child) {
    return Container(
      width: MediaQuery.of(context).size.width - 40.rpx,
      padding: EdgeInsets.all(12.rpx),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(4.rpx),
        color: Colors.white,
      ),
      child: child,
    );
  }

  // 制作材料列表
  Widget buildBodyMid(BuildContext context) {
    return buildWrap(
      context,
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _meal.ingredients?.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Colors.amber,
            elevation: 4.rpx,
            child: Padding(
              padding: EdgeInsets.all(20.rpx),
              child: Text(_meal.ingredients?[index] ?? ''),
            ),
          );
        },
      ),
    );
  }

  // 步骤列表
  Widget buildBodyBottom(BuildContext context) {
    return buildWrap(
      context,
      ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _meal.steps?.length ?? 0,
        separatorBuilder: (ctx, index) {
          return Divider();
        },
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('#${index + 1}')),
            title: Text(_meal.steps?[index] ?? ''),
          );
        },
      ),
    );
  }
}
