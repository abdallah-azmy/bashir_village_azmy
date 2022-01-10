import 'package:flutter/material.dart';

class RegisterTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextInputType type;

  const RegisterTextField({Key key, this.icon, this.label, this.type})
      : super(key: key);

  @override
  _RegisterTextFieldState createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Container(
          height: 50,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              textAlign: TextAlign.right,
              keyboardType: widget.type,
              decoration: InputDecoration(
                labelText: widget.label,
                suffixIcon: widget.icon != null
                    ? Padding(
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(242, 242, 242, 1)),
                          child: Icon(widget.icon),
                        ),
                      )
                    : null,
                contentPadding: EdgeInsets.only(top: 20, right: 10),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
        ));
  }
}
