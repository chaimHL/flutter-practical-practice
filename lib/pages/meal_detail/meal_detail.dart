import 'package:flutter/material.dart';
import 'package:food_galaxy/model/meal_model.dart';

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
      body: Text('2'),
    );
  }
}
