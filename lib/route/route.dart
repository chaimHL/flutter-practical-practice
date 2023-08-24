import 'package:flutter/material.dart';
import 'package:food_galaxy/pages/filter/filter.dart';
import 'package:food_galaxy/pages/initial/initial.dart';
import 'package:food_galaxy/pages/meal/meal.dart';
import 'package:food_galaxy/pages/meal_detail/meal_detail.dart';

import '../pages/unknown/404.dart';

class QYRoute {
  // 映射
  static final Map<String, WidgetBuilder> routes = {
    QYInitialPage.routeName: (ctx) => QYInitialPage(),
    QYMealPage.routeName: (ctx) => QYMealPage(),
    QYMealDetailPage.routeName: (ctx) => QYMealDetailPage(),
    QYFilterPage.routeName: (ctx) => QYFilterPage()
  };

  // 初始页
  static final String initialRoute = QYInitialPage.routeName;

  // 404 页面
  static final RouteFactory onUnknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) {
      return QYUnknownPage();
    });
  };
}
