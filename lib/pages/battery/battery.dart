import 'package:flutter/material.dart';
import 'package:food_galaxy/pages/battery/battery_body.dart';

class QYBatteryPage extends StatelessWidget {
  static const String routeName = '/battery';

  const QYBatteryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电量信息'),
      ),
      body: QYBatteryBody(),
    );
  }
}
