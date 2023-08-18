import 'package:flutter/material.dart';
import 'package:food_galaxy/common/rpx.dart';

class QYIconLabel extends StatelessWidget {
  const QYIconLabel({super.key, required this.icon, required this.label});

  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 8.rpx,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
