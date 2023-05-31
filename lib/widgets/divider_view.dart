import 'package:flutter/material.dart';
import 'package:vsounds/design/colors.dart';

class DividerView extends StatelessWidget {
  const DividerView({
    super.key,
    this.margin,
    this.color,
  });

  final double? margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.separator,
      ),
      height: 1,
      margin: EdgeInsets.symmetric(vertical: margin ?? 24),
    );
  }
}
