import 'package:bashir_village/src/Helpers/myColors.dart';
import 'package:flutter/material.dart';



class CustomCircularLoading extends StatelessWidget {
  final double size;
  final double widthOfIndicator;
  final double padding;
  final color;

  CustomCircularLoading(
      {Key key, this.size, this.padding, this.color, this.widthOfIndicator});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size ?? 24,
        width: size ?? 24,
        child: Padding(
          padding: EdgeInsets.all(padding ?? 3.0),
          child: CircularProgressIndicator(
            color: color ?? MyColors.blueBlack,
            strokeWidth: widthOfIndicator ?? 4.0,
          ),
        ));
  }
}
