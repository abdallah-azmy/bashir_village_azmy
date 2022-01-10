import 'dart:convert';
import 'package:bashir_village/src/Helpers/route.dart';
import 'package:bashir_village/src/UI/Basics/Register/SignUp/signUpCubit/sign_up_cubit.dart';
import 'package:bashir_village/src/UI/Intro/firstPage.dart';
import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/MainWidgets/customLinearLoading.dart';
import 'package:bashir_village/src/UI/MainWidgets/toast.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../mainPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _show = true;
  String name;
  String email;
  String password;
  String confirmPassword;
  final _form = GlobalKey<FormState>();

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
          // SignUpCubit
        child: BlocConsumer<SignUpCubit,SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              if (state.registerModel.code == 200) {


                CacheHelper.saveData(
                    key: 'token',
                    value: state.registerModel.data[0].apiToken)
                    .then((value) {
                  CacheHelper.saveData(
                      key: 'userData',
                      value: json.encode(state.registerModel.toJson()));
                  print("User Data : " +
                      CacheHelper.getData(key: "userData"));
                });

                showToast(
                    msg: "تم التسجيل بنجاح",
                    state: ToastStates.SUCCESS);
                Future.delayed(Duration(milliseconds: 300), () {
                  pushAndRemoveUntil(context, MainPage());
                });



              } else {
                showToast(
                    msg: state.registerModel.error[0].value,
                    state: ToastStates.ERROR);
              }
            }
          },
          builder: (context,state){
            var cubit = SignUpCubit.get(context);
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
                                    builder: (context) => FirstPage())),
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
                    'اهلًا بكم في تطبيق قرية بشير تفضل بتسجيل اشتراك جديد',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'الاسم الكامل',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'برجاء ادخال اسم صحيح.';
                          }
                          if (value.length < 3) {
                            return 'بحد ادني 3 احرف.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          cubit.name = value ;
                          setState(() {
                            name = value;
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
                          cubit.email = value ;
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
                                child: Icon(Icons.remove_red_eye))),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'برجاء ادخال كلمة مرور صحيحة.';
                          }
                          if (value.length < 8) {
                            return 'بحد ادني 10 احرف.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          cubit.password = value ;
                          password = value;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        obscureText: _show,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'تاكيد كلمة المرور',
                            suffixIcon: InkWell(
                                onTap: _changeShow,
                                child: Icon(Icons.remove_red_eye))),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'تاكيد كلمة المرور';
                          }
                          if (value.length < 8) {
                            return 'بحد ادني 10 احرف.';
                          }
                          // if (value != password) return "كلمة السر غير متطابقه";
                          return null;
                        },
                        onSaved: (value) {
                          cubit.confirmPassword = value ;
                          confirmPassword = value;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  (state is SignUpLoadingState)
                      ? CustomLinearLoading(horizontalPadding: 0,)
                      :CustomBtn(
                      text: 'إشتراك جديد',
                      onTap: () {

                        _saveForm();
                      },
                      color: Theme.of(context).primaryColor),
                  SizedBox(height: 20),
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

    SignUpCubit.get(context).signUp();

  }
}
