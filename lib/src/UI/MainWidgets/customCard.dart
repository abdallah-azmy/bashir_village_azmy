// import 'package:cache_image/cache_image.dart';
import 'package:bashir_village/src/UI/MainWidgets/networkImage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class CustomCard extends StatefulWidget {
  final String image;
  final String title;
  final Function onTap;
  final int numComment;
  final int seen;
  final DateTime createdAt;
  final int newsId;
  final bool fav;

  const CustomCard({
    Key key,
    this.image,
    this.onTap,
    this.title,
    this.numComment,
    this.seen,
    this.createdAt,
    this.newsId,
    this.fav,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  String _title = '';
  String _time = '';

  _getText() {
    if (widget.title.length > 70) {
      setState(() {
        _title = widget.title.substring(0, 65) + " ... ";
      });
    } else {
      setState(() {
        _title = widget.title;
      });
    }
  }



  @override
  void initState() {
    super.initState();
    _time =
        "${intl.DateFormat.d().format(widget.createdAt)}/${intl.DateFormat.M().format(widget.createdAt)}/${intl.DateFormat.y().format(widget.createdAt)}";
    _getText();
  }

  String shareLink;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        _title,
                        softWrap: true,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "${widget.numComment} ",
                                    style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.comment,
                                    size: 16,
                                    color: Theme
                                        .of(context)
                                        .primaryColor,
                                  )
                                ],
                              ),
                              SizedBox(width: 30),
                              Row(
                                children: <Widget>[
                                  Text(
                                    widget.seen.toString(),
                                    style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.remove_red_eye,
                                    size: 16,
                                    color: Theme
                                        .of(context)
                                        .primaryColor,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            _time,
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: 100,
                      height: 100,
                      child:
                      CustomNetworkImage(
                        image: widget.image,
                        fit: BoxFit.fill,
                      ),
                      // FadeInImage(
                      //     fit: BoxFit.cover,
                      //     placeholder: AssetImage('assets/placeholder.png'),
                      //     image:
                      //
                      //     widget.image == null
                      //         ? NetworkImage('assets/placeholder.png')
                      //         : NetworkImage(widget.image))


                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
          )
        ],
      ),
    );
  }

}
