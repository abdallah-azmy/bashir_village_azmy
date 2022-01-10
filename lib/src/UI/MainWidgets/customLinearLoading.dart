import 'package:bashir_village/src/Helpers/myColors.dart';
import 'package:flutter/material.dart';

class CustomLinearLoading extends StatelessWidget {
  final double horizontalPadding;
  final double verticalPadding;
  final color;
  final backGroundColor;

  CustomLinearLoading({
    Key key,
    this.horizontalPadding,
    this.verticalPadding,
    this.color,
    this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 23, horizontal: horizontalPadding ?? 25),
      child: LinearProgressIndicator(
        color: color ?? MyColors.blueBlack,
        backgroundColor: backGroundColor ?? Colors.transparent,
      ),
    );
  }
}
