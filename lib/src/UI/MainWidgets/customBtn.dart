import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatefulWidget {
  final String text;
  final Function onTap;
  final Color color;

  const CustomBtn(
      {Key key,
      @required this.text,
      @required this.onTap,
      @required this.color})
      : super(key: key);

  @override
  _CustomBtnState createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: MaterialButton(
          onPressed: widget.onTap,
          color: widget.color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
