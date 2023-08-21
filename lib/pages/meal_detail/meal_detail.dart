import 'package:flutter/material.dart';
import 'package:food_galaxy/model/meal_model.dart';
import 'package:food_galaxy/pages/meal_detail/meal_detail_body.dart';

class QYMealDetailPage extends StatelessWidget {
  static const String routeName = '/meal-detail';
  const QYMealDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as QyMealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title!),
      ),
      body: QYMealDetailBody(meal),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite_border),
        onPressed: () {},
      ),
    );
  }
}
