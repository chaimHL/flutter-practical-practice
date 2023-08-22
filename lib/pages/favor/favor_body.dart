import 'package:flutter/material.dart';
import 'package:food_galaxy/store/favor_store.dart';
import 'package:food_galaxy/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class QYFavorBody extends StatelessWidget {
  const QYFavorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QYFavorStore>(builder: (ctx, value, child) {
      if (value.favors.length == 0) {
        return Center(
          child: Text('暂无收藏'),
        );
      }
      return ListView.builder(
          itemCount: value.favors.length,
          itemBuilder: (itemCtx, index) {
            return QYMealItem(value.favors[index]);
          });
    });
  }
}
