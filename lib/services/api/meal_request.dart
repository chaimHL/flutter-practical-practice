import 'package:food_galaxy/model/meal_model.dart';
import 'package:food_galaxy/services/http_request.dart';

class QYMealRequest {
  static Future<List<QyMealModel>> getList() async {
    final url = '/meal';
    final result = await QYHttpRequest.request(url);
    final meals = result['meal'];
    List<QyMealModel> list = [];
    for (var item in meals) {
      list.add(QyMealModel.fromJson(item));
    }
    return list;
  }
}
