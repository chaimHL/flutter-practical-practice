import 'package:flutter/material.dart';
import 'package:food_galaxy/common/rpx.dart';
import 'package:food_galaxy/route/route.dart';
import 'package:food_galaxy/store/meal_store.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (ctx) => QYMealStore(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 初始化 rpx
    QYRpx.init(context);

    return MaterialApp(
      title: '美食荟萃',
      // 主题
      theme: QYTheme.theme,
      // 路由
      routes: QYRoute.routes,
      initialRoute: QYRoute.initialRoute,
      onUnknownRoute: QYRoute.onUnknownRoute,
    );
  }
}
