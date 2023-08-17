import 'package:flutter/material.dart';
import 'package:food_galaxy/model/category_model.dart';
import 'package:food_galaxy/model/meal_model.dart';
import 'package:food_galaxy/store/meal_store.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class QYMealPage extends StatelessWidget {
  static const String routeName = '/meal';
  const QYMealPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取路由传参
    final category =
        ModalRoute.of(context)?.settings.arguments as QyCategoryItem;

    return Scaffold(
      appBar: AppBar(
        title: Text('${category.title}'),
      ),
      body: Selector<QYMealStore, List<QyMealModel>>(
        selector: (ctx, mealStore) {
          // 筛选出 mealStore.meals 的元素中，categories 包含对应的 category 的 id 的元素返回
          return mealStore.meals
              .where((element) => element.categories!.contains(category.id))
              .toList();
        },
        shouldRebuild: (List<QyMealModel> previous, List<QyMealModel> next) {
          return !ListEquality().equals(previous, next);
        },
        builder: (BuildContext ctx, List<QyMealModel> value, Widget? child) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (ctx, index) {
              return Text(value[index].title ?? '1');
            },
          );
        },
      ),
    );
  }
}
