import 'package:flutter/material.dart';
import 'package:food_galaxy/model/meal_model.dart';

class QYFavorStore extends ChangeNotifier {
  List<QyMealModel> _favors = [];

  List<QyMealModel> get favors {
    return _favors;
  }

  // 添加收藏
  void add(QyMealModel meal) {
    _favors.add(meal);
    notifyListeners();
  }

  // 删除收藏
  void remove(QyMealModel meal) {
    _favors.remove(meal);
    notifyListeners();
  }

  // 判断是否收藏
  bool isFavor(QyMealModel meal) {
    return _favors.contains(meal);
  }

  // 处理点击收藏按钮
  void processFavor(QyMealModel meal) {
    if (isFavor(meal)) {
      remove(meal);
    } else {
      add(meal);
    }
  }
}
