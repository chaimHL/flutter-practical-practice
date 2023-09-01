import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_galaxy/common/rpx.dart';
import 'package:food_galaxy/i18n/localizations_delegate.dart';
import 'package:food_galaxy/route/route.dart';
import 'package:food_galaxy/store/favor_store.dart';
import 'package:food_galaxy/store/filter_store.dart';
import 'package:food_galaxy/store/meal_store.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => QYFavorStore()),
      ChangeNotifierProvider(create: (ctx) => QYFilterStore()),
      ChangeNotifierProxyProvider<QYFilterStore, QYMealStore>(
        create: (ctx) => QYMealStore(),
        update: (ctx, value, previous) {
          previous?.updateFilters(value);
          return previous!;
        },
      ),
    ],
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
      // 国际化
      // supportedLocales: [Locale('zh'), Locale('en')],
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // QYlocalizationsDelegate.delegate
        S.delegate
      ],
      locale: Locale('en'),
      // 路由
      routes: QYRoute.routes,
      initialRoute: QYRoute.initialRoute,
      onUnknownRoute: QYRoute.onUnknownRoute,
    );
  }
}
