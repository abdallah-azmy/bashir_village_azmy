import 'package:bashir_village/src/UI/Basics/Register/Login/login.dart';
import 'package:bashir_village/src/UI/Basics/Register/SignUp/signUp.dart';
import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/mainPage.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/splash.png'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: CustomBtn(
                      text: 'تسجيل الدخول',
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage())),
                      color: Color.fromRGBO(52, 128, 90, 1)),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: CustomBtn(
                      text: 'اشتراك جديد',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage())),
                      color: Color.fromRGBO(203, 172, 48, 1)),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainPage())),
                  child: Text(
                    'الدخول كزائر',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
