import 'package:flutter/cupertino.dart';
import 'package:food_galaxy/model/meal_model.dart';

import '../services/api/meal_request.dart';

class QYMealStore extends ChangeNotifier {
  List<QyMealModel> _meals = [];

  List<QyMealModel> get meals {
    return _meals;
  }

  QYMealStore() {
    QYMealRequest.getList().then((value) {
      _meals = value;
      notifyListeners();
    });
  }
}
