import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  final int maxLines;
  final Color color;
  final String init;
  final Function onChang;
  final double high;

  const CustomTextField({
    Key key,
    this.label,
    this.icon,
    this.hint,
    this.maxLines,
    this.color,
    this.onChang,
    this.init,
    this.high,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 10, right: 10, left: 10),
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: <Widget>[
          Container(
            height: widget.high == null ? 50 : widget.high,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.color == null
                  ? Color.fromRGBO(220, 220, 220, 1)
                  : widget.color,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextFormField(
                textDirection: TextDirection.rtl,
                initialValue: widget.init,
                minLines: widget.maxLines,
                maxLines: widget.maxLines == null ? 200 : widget.maxLines,
                textAlign: TextAlign.right,
                keyboardType: widget.hint == "رقم جوالك للتواصل معك" ? TextInputType.number :TextInputType.text ,
                inputFormatters: widget.hint == "رقم جوالك للتواصل معك"
                    ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                    : <TextInputFormatter>[],
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.send),
                    hintText: widget.hint,
                    border: InputBorder.none),
                onChanged: widget.onChang,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
