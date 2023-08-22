import 'package:flutter/material.dart';
import 'package:food_galaxy/model/meal_model.dart';
import 'package:food_galaxy/pages/meal_detail/meal_detail_body.dart';
import 'package:food_galaxy/store/favor_store.dart';
import 'package:provider/provider.dart';

class QYMealDetailPage extends StatelessWidget {
  static const String routeName = '/meal-detail';
  const QYMealDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as QyMealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title!),
      ),
      body: QYMealDetailBody(meal),
      floatingActionButton: buildFloatingBtn(meal),
    );
  }

  // 悬浮按钮
  Consumer<QYFavorStore> buildFloatingBtn(QyMealModel meal) {
    return Consumer<QYFavorStore>(
      builder: (ctx, value, child) {
        // 判断是否已收藏
        final isFavor = value.isFavor(meal);
        return FloatingActionButton(
          child: Icon(isFavor ? Icons.favorite : Icons.favorite_border),
          onPressed: () {
            value.processFavor(meal);
          },
        );
      },
    );
  }
}
