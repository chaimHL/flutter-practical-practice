import 'package:flutter/cupertino.dart';
import 'package:food_galaxy/model/meal_model.dart';
import 'package:food_galaxy/store/filter_store.dart';

import '../services/api/meal_request.dart';

class QYMealStore extends ChangeNotifier {
  List<QyMealModel> _meals = [];
  late QYFilterStore _filterStore;

  List<QyMealModel> get meals {
    return _meals.where((element) {
      if (_filterStore.isGlutenFree && !element.isGlutenFree!) return false;
      if (_filterStore.isLactoseFree && !element.isLactoseFree!) return false;
      if (_filterStore.isVegan && !element.isVegan!) return false;
      return true;
    }).toList();
  }

  void updateFilters(QYFilterStore value) {
    _filterStore = value;
  }

  QYMealStore() {
    QYMealRequest.getList().then((value) {
      _meals = value;
      notifyListeners();
    });
  }
}
