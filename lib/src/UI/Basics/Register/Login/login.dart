import 'dart:convert';
import 'package:bashir_village/src/Helpers/route.dart';
import 'package:bashir_village/src/UI/Basics/Register/Login/loginCubit/login_cubit.dart';
import 'package:bashir_village/src/UI/Basics/Register/forgetPassword/forgetPassword.dart';
import 'package:bashir_village/src/UI/Basics/Register/SignUp/signUp.dart';
import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/MainWidgets/customLinearLoading.dart';
import 'package:bashir_village/src/UI/MainWidgets/toast.dart';
import 'package:bashir_village/src/UI/mainPage.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _show = true;
  final _form = GlobalKey<FormState>();
  String email;
  String password;


  _changeShow() {
    setState(() {
      _show = !_show;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _form,
        child: BlocConsumer<LoginCubit,LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              if (state.loginModel.code == 200) {
                CacheHelper.saveData(
                    key: 'token',
                    value: state.loginModel.data[0].apiToken)
                    .then((value) {
                  CacheHelper.saveData(
                      key: 'userData',
                      value: json.encode(state.loginModel.toJson()));
                  print("User Data : " +
                      CacheHelper.getData(key: "userData"));
                });
                showToast(
                    msg: "تم تسجيل الدخول بنجاح",
                    state: ToastStates.SUCCESS);
                Future.delayed(Duration(milliseconds: 300), () {
                  pushAndRemoveUntil(context, MainPage());
                });
              } else {
                showToast(
                    msg: state.loginModel.error[0].value,
                    state: ToastStates.ERROR);

              }
            }
          },
          builder: (context , state) {
            var loginCubit = LoginCubit.get(context);
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage())),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Theme.of(context).primaryColor,
                            ))
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/logo.png',
                    width: 250,
                    height: 250,
                  ),
                  Text(
                    'اهلًا بكم في تطبيق قرية بشير تفضل بتسجيل الدخول',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'البريد الإكتروني',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'برجاء ادخال بريد صحيح.';
                          }
                          if (value.length < 8) {
                            return 'بحد ادني 10 احرف.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          loginCubit.email = value ;
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        obscureText: _show,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'كلمة المرور',
                            suffixIcon: InkWell(
                                onTap: _changeShow,
                                child: Icon(
                                  _show == false
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off,
                                ))),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'برجاء ادخال كلمة مرور صحيحة.';
                          }
                          if (value.length < 8) {
                            return 'بحد ادني 8 احرف.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          loginCubit.password = value ;
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  (state is LoginLoadingState)
                      ? CustomLinearLoading(horizontalPadding: 0,)
                      :CustomBtn(
                      text: 'تسجيل الدخول',
                      onTap: () {
                        _saveForm();
                      },
                      color: Theme.of(context).primaryColor),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      InkWell(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUpPage())),
                        child: Text(
                          'إشتراك جديد؟',
                          style: TextStyle(
                              fontSize: 15, color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPasswordPage())),
                        child: Text(
                          "استعادة كلمة المرور؟",
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    LoginCubit.get(context).login();
  }
}
