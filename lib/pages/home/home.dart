import 'package:flutter/material.dart';
import 'package:food_galaxy/common/rpx.dart';
import 'package:food_galaxy/model/category_model.dart';
import 'package:food_galaxy/services/json_parse.dart';

class QYHomePage extends StatefulWidget {
  const QYHomePage({super.key});

  @override
  State<QYHomePage> createState() => _QYHomePageState();
}

class _QYHomePageState extends State<QYHomePage> {
  List<QyCategoryItem> _list = [];

  @override
  void initState() {
    super.initState();
    QYJsonParse.getCategoryData().then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食荟萃'),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(20.rpx),
          itemCount: _list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.rpx,
            mainAxisSpacing: 20.rpx,
            childAspectRatio: 1.5, // 宽高比
          ),
          itemBuilder: (ctx, index) {
            final bgColor = _list[index].actualColor;
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.rpx),
                // 渐变色背景
                gradient:
                    LinearGradient(colors: [bgColor.withOpacity(0.5), bgColor]),
              ),
              alignment: Alignment.center,
              child: Text(
                _list[index].title,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            );
          }),
    );
  }
}
