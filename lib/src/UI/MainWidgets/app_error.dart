import 'package:bashir_village/src/Helpers/myColors.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppError extends StatefulWidget {
  final String text;
  final double height;

  const AppError({Key key, this.text, this.height}) : super(key: key);

  @override
  _AppErrorState createState() => _AppErrorState();
}

class _AppErrorState extends State<AppError> {

  bool isOnline ;

  connection()async{

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
   setState(() {
     isOnline = false ;
   });
    } else  {
      setState(() {
        isOnline = true ;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    connection();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? null,
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: widget.height ?? null,
            child: Column(children: [
              isOnline == null ? Container() : (isOnline == false)  ?   Lottie.asset(
                'assets/lolitJson/36031-error-de-conexion.json' ,
                // 'assets/lolitJson/errorNotFound.json',
//              height: 250,
//               width: MediaQuery.of(context).size.width ,
                width: MediaQuery.of(context).size.width *   ( (isOnline == false)  ? 1 : .5),
              ) :  Flexible(
                child: Lottie.asset(
                  // 'assets/lolitJson/36031-error-de-conexion.json' ,
                  'assets/lolitJson/emptyLotti.json',
//              height: 250,
                  width: MediaQuery.of(context).size.width * .9,

//               width: MediaQuery.of(context).size.width *   ( (isOnline == false)  ? 1 : .5),
                ),
              ),
              SizedBox(height: 20),
              Text(widget.text ?? "حدث خطأ ما .. برجاء اعادة المحاولة",
                  textAlign: TextAlign.center,
                  style: MyColors.styleHint)
            ],),
          )

        ],
      ),
    );
  }
}
