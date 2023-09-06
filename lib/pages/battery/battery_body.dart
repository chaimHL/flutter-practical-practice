import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QYBatteryBody extends StatefulWidget {
  const QYBatteryBody({super.key});

  @override
  State<QYBatteryBody> createState() => _QYBatteryBodyState();
}

class _QYBatteryBodyState extends State<QYBatteryBody> {
  static const platform = MethodChannel('chaim.com/battery');
  int _batteryLevel = 0; // 电量

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: getBatteryLevel,
            child: Text('获取电量'),
          ),
          Text(
            '当前电量：$_batteryLevel',
            style: Theme.of(context).textTheme.displayMedium,
          )
        ],
      ),
    );
    ;
  }

  // 获取电量信息
  void getBatteryLevel() async {
    final result = await platform.invokeMethod('getBatteryLevel');
    setState(() {
      _batteryLevel = result;
    });
  }
}
