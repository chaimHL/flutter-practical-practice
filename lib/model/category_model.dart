import 'dart:convert';
import 'dart:ui';

QyCategoryItem qyCategoryItemFromJson(String str) =>
    QyCategoryItem.fromJson(json.decode(str));

String qyCategoryItemToJson(QyCategoryItem data) => json.encode(data.toJson());

class QyCategoryItem {
  String id;
  String title;
  String color;
  Color actualColor;

  QyCategoryItem(
      {required this.id,
      required this.title,
      required this.color,
      required this.actualColor});

  factory QyCategoryItem.fromJson(Map<String, dynamic> json) => QyCategoryItem(
        id: json["id"],
        title: json["title"],
        color: json["color"],
        // int.parse 将字符串，比如 '9C27B0' 转换成 16 进制（通过 radix: 16 指定）的值，然后通过按位或运算符 | 添加上透明度的值 FF
        actualColor: Color(int.parse(json["color"], radix: 16) | 0xFF000000),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "color": color,
      };
}
