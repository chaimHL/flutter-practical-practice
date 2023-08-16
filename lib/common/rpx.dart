import 'package:flutter/material.dart';

extension responsivePx on num {
  double get rpx {
    return this.toDouble() * QYRpx.rpx;
  }
}

class QYRpx {
  static late double logicWidth;
  static late double rpx;

  static void init(BuildContext context) {
    // 获取屏幕逻辑分辨率宽度
    logicWidth = MediaQuery.of(context).size.width;

    // 1rpx 的值
    rpx = (logicWidth / 375) / 2;
  }
}
