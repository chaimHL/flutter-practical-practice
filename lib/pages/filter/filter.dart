import 'package:flutter/material.dart';
import 'package:food_galaxy/common/rpx.dart';
import 'package:food_galaxy/store/filter_store.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../i18n/localizations.dart';

class QYFilterPage extends StatelessWidget {
  static const String routeName = '/filter';

  const QYFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('过滤设置'),
      ),
      body: buildBody(context),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      children: [
        buildBodyTitle(context),
        buildBodyList(),
        buildi18ntest(context)
      ],
    );
  }

  // 内容标题
  Container buildBodyTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.rpx),
      alignment: Alignment.center,
      child: Text(
        '展示你的选择',
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  // 筛选列表
  Expanded buildBodyList() {
    return Expanded(
      child: Consumer<QYFilterStore>(
        builder: (ctx, value, child) {
          return ListView(
            children: [
              ListTile(
                title: Text('无谷蛋白'),
                subtitle: Text('展示无谷蛋白食物'),
                trailing: Switch(
                  value: value.isGlutenFree,
                  onChanged: (e) {
                    value.isGlutenFree = e;
                  },
                ),
              ),
              ListTile(
                title: Text('不含乳糖'),
                subtitle: Text('展示不含乳糖食物'),
                trailing: Switch(
                  value: value.isLactoseFree,
                  onChanged: (e) {
                    value.isLactoseFree = e;
                  },
                ),
              ),
              ListTile(
                title: Text('素食主义'),
                subtitle: Text('展示素食相关食物'),
                trailing: Switch(
                  value: value.isVegan,
                  onChanged: (e) {
                    value.isVegan = e;
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }

  // 国际化测试
  Widget buildi18ntest(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(3000),
        );
      },
      // child: Text(QYLocalizations.of(context).xuanzeriqi!),
      child: Text(S.of(context).xuanzeriqi('8')),
    );
  }
}
