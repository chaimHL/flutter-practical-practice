import 'dart:convert';

QyMealModel qyMealModelFromJson(String str) =>
    QyMealModel.fromJson(json.decode(str));

String qyMealModelToJson(QyMealModel data) => json.encode(data.toJson());

List<String> complexityArr = ['简单', '普通', '困难'];

class QyMealModel {
  String? id;
  List<String>? categories;
  String? title;
  int? affordability;
  int? complexity;
  String? complexityStr;
  String? imageUrl;
  int? duration;
  List<String>? ingredients;
  List<String>? steps;
  bool? isGlutenFree;
  bool? isVegan;
  bool? isVegetarian;
  bool? isLactoseFree;

  QyMealModel({
    this.id,
    this.categories,
    this.title,
    this.affordability,
    this.complexity,
    this.complexityStr,
    this.imageUrl,
    this.duration,
    this.ingredients,
    this.steps,
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.isLactoseFree,
  });

  factory QyMealModel.fromJson(Map<String, dynamic> json) => QyMealModel(
        id: json["id"],
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
        title: json["title"],
        affordability: json["affordability"],
        complexity: json["complexity"],
        complexityStr: complexityArr[json["complexity"]],
        imageUrl: json["imageUrl"],
        duration: json["duration"],
        ingredients: json["ingredients"] == null
            ? []
            : List<String>.from(json["ingredients"]!.map((x) => x)),
        steps: json["steps"] == null
            ? []
            : List<String>.from(json["steps"]!.map((x) => x)),
        isGlutenFree: json["isGlutenFree"],
        isVegan: json["isVegan"],
        isVegetarian: json["isVegetarian"],
        isLactoseFree: json["isLactoseFree"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "title": title,
        "affordability": affordability,
        "complexity": complexity,
        "imageUrl": imageUrl,
        "duration": duration,
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x)),
        "steps": steps == null ? [] : List<dynamic>.from(steps!.map((x) => x)),
        "isGlutenFree": isGlutenFree,
        "isVegan": isVegan,
        "isVegetarian": isVegetarian,
        "isLactoseFree": isLactoseFree,
      };
}
