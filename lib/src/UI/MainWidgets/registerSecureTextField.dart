import 'package:flutter/material.dart';

class RegisterSecureTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final VoidCallback onPressed;
  final bool withIcon;

  const RegisterSecureTextField(
      {Key key, this.obscureText, this.onPressed, this.withIcon, this.label})
      : super(key: key);

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
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: label,
              suffixIcon: withIcon == true
                  ? Padding(
                      padding: EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black12),
                        child: obscureText
                            ? InkWell(
                                onTap: onPressed,
                                child: Icon(Icons.visibility_off),
                              )
                            : InkWell(
                                onTap: onPressed,
                                child: Icon(Icons.visibility),
                              ),
                      ))
                  : null,
              contentPadding: EdgeInsets.only(top: 20, right: 10),
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
