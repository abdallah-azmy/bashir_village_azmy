import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomWidgetBody extends StatefulWidget {
  final body;
  final service;

  const CustomWidgetBody({Key key, this.body, this.service,})
      : super(key: key);
  @override
  _CustomWidgetBodyState createState() => _CustomWidgetBodyState();
}

class _CustomWidgetBodyState extends State<CustomWidgetBody> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.service,
      builder: (context, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SpinKitThreeBounce(
              size: 25,
              color: Colors.green,
            ),
          );
        } else {
          if (dataSnapshot.error != null) {
            print(dataSnapshot.error);
            return Center(
              child: Text('هناك خطا يرجي اعادة المحاولة'),
            );
          }
          else {
            return
              // dataSnapshot.data.data == null ||
              //       dataSnapshot.data.data == []
              //   ? Center(child: Text("لا يوجد بيانات"))
              //   :
            widget.body;
          }
        }
      },
    );
  }
}
