import 'package:flutter/material.dart';

import '../notificationDetails.dart';

class NotificationsCard extends StatefulWidget {
  final String label;
  final String msg;
  final String date;
  final int id;
  final String type;

  const NotificationsCard(
      {Key key, this.label, this.msg, this.date, this.id, this.type})
      : super(key: key);

  @override
  _NotificationsCardState createState() => _NotificationsCardState();
}

class _NotificationsCardState extends State<NotificationsCard> {
  String _title = "";
  _getText() {
    if (widget.label.length > 20) {
      setState(() {
        _title = widget.label.substring(0, 20) + " ... ";
      });
    } else {
      setState(() {
        _title = widget.label;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getText();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.type == "1") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctxt) => NotificationDetails(
                        id: widget.id,
                      )));
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Card(
          color: Colors.white,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.date,
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(_title,
                          style: TextStyle(fontSize: 15, color: Colors.grey)),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  widget.msg,
                  textAlign: TextAlign.right,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
