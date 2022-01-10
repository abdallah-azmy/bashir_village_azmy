import 'package:bashir_village/src/Helpers/route.dart';
import 'package:bashir_village/src/UI/Basics/Register/confirmCode/confirmCode.dart';
import 'package:bashir_village/src/UI/Basics/Register/forgetPassword/forgetPasswordCubit/forget_password_cubit.dart';
import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/MainWidgets/customLinearLoading.dart';
import 'package:bashir_village/src/UI/MainWidgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  String code;

  String email;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if(state is ForgetPasswordSuccessState){
            if(state.forgetPasswordModel.code ==200){
              showToast(msg: state.forgetPasswordModel.data.value, state: ToastStates.SUCCESS);
              Future.delayed(Duration(milliseconds: 400),(){
                push(context, ConfirmCode(
                  email: email,
                ));
              });
            }else{
              showToast(msg: state.forgetPasswordModel.error[0].value, state: ToastStates.ERROR);


            }
          }
        },
        builder: (context,state){
         var cubit = ForgetPasswordCubit.get(context);
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                          onTap: () => Navigator.pop(context),
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
                  'اهلًا بكم في تطبيق قرية بشير قم بإدخال البريد الالكتروني لإرسال كلمة المرور الجديدة لحسابك',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'البريد الإكتروني',
                      ),
                      onChanged: (value) {
                        cubit.email = value ;
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                (state is ForgetPasswordLoadingState) ? CustomLinearLoading(horizontalPadding: 0,):  CustomBtn(
                    text: 'إرسال كلمة المرور',
                    onTap: () {
                      ForgetPasswordCubit.get(context).forgetPass();
                    },
                    color: Theme.of(context).primaryColor),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        },
      ),
    );
  }


}
