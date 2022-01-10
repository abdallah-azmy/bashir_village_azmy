import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

class AppLoader extends StatelessWidget {
  final String title;
  final double height;
  final Color color;

  const AppLoader({Key key, this.title,this.height,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child:
            Center(
              child: SpinKitThreeBounce(
                size: 25,
                color: color ?? Theme.of(context).primaryColor,
              ),
            )
//             Lottie.asset(
//               'assets/lolitJson/85969-loading.json',
//               // 'assets/lolitJson/loading.json',
//              height: MediaQuery.of(context).size.width * .7,
// //              width: MediaQuery.of(context).size.width * .7,
//             ),
          ),
          title == null ? Container() :  SizedBox(height: 20),
          title == null ? Container() :  Text(title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, color: Colors.grey))
        ],
      ),
    );
  }
}
