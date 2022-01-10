import 'package:bashir_village/src/Helpers/myColors.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppEmpty extends StatelessWidget {
  final String text;
  final double height;

  const AppEmpty({Key key, this.text, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              child: Lottie.asset(
            'assets/lolitJson/emptyLotti.json',
            height: 250,
            width: MediaQuery.of(context).size.width * .8,
          )),
          SizedBox(height: 20),
          Text(text ?? "لا يوجد اتصال بالانترنت",
              textAlign: TextAlign.center,
              style: MyColors.styleHint)
        ],
      ),
    );
  }
}
