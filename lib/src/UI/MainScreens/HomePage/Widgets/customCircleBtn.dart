import 'package:bashir_village/src/UI/Basics/Terms/aboutVillage.dart';
import 'package:bashir_village/src/UI/SupScreens/News/news.dart';
import 'package:bashir_village/src/UI/SupScreens/Photos/photos.dart';
import 'package:bashir_village/src/UI/SupScreens/Videos/videos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCircleBtn extends StatefulWidget {
  final title;
  final int type;
  final String img;

  const CustomCircleBtn({Key key, this.title, this.img, this.type,})
      : super(key: key);

  @override
  _CustomCircleBtnState createState() => _CustomCircleBtnState();
}

class _CustomCircleBtnState extends State<CustomCircleBtn> {
  _launchURL() async {
    const url = 'https://wa.me/966583023086';
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.type == 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutVillage()));
        } else if (widget.type == 1) {
          print("call user");
          _launchURL();
        } else if (widget.type == 3) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Photos()));
        } else if (widget.type == 4) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Videos()));
        } else if (widget.type == 5) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MomentByMoment()));
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white),
              width: 55,
              height: 55,
              child: Center(
                child: Image.asset(
                  widget.img,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.title,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
