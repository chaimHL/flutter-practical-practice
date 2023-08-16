import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_galaxy/model/category_model.dart';

class QYJsonParse {
  static Future<List<QyCategoryItem>> getCategoryData() async {
    // 加载 json 文件，得到的是字符串
    final jsonString = await rootBundle.loadString('assets/json/category.json');

    // 将字符串转成 Map 或 List
    final result = json.decode(jsonString);

    // 获取 category 数组
    final mapList = result['category'];
    List<QyCategoryItem> list = [];
    for (var item in mapList) {
      list.add(QyCategoryItem.fromJson(item));
    }
    return list;
  }
}
