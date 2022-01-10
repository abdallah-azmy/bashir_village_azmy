import 'package:bashir_village/src/Helpers/route.dart';
import 'package:bashir_village/src/UI/Basics/Register/confirmCode/confirmCodeCubit/confirm_code_cubit.dart';
import 'package:bashir_village/src/UI/Basics/Register/resetPassword.dart';
import 'package:bashir_village/src/UI/MainWidgets/customCircularLoading.dart';
import 'package:bashir_village/src/UI/MainWidgets/toast.dart';
import 'package:bashir_village/src/provider/ConfirmCode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

class ConfirmCode extends StatefulWidget {
  final String email;

  const ConfirmCode({Key key, this.email}) : super(key: key);
  @override
  _ConfirmCodeState createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  String code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ConfirmCodeCubit, ConfirmCodeState>(
        listener: (context, state) {
          if (state is ConfirmCodeSuccessState) {
            if (state.confirmResetCodeModel.code == 200) {
              showToast(
                  msg: state.confirmResetCodeModel.data.value,
                  state: ToastStates.SUCCESS);
              Future.delayed(Duration(milliseconds: 400), () {
                push(
                    context,
                    ResetPassword(
                      email: widget.email,
                    ));
              });
            } else {
              showToast(
                  msg: state.confirmResetCodeModel.error[0].value,
                  state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          var cubit = ConfirmCodeCubit.get(context);
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
                  'اهلًا بكم في تطبيق قرية بشير تفضل بتسجيل الدخول',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                (state is ConfirmCodeLoadingState)
                    ? Center(
                        child: CustomCircularLoading(),
                      )
                    : Column(
                        children: <Widget>[
                          Center(
                              child: PinCodeTextField(
                            length: 4,
                            onChanged: (_) {},
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            appContext: context,
                            // activeColor: Theme.of(context).primaryColor,
                            // inactiveColor: Colors.grey,
                            // textInputType: TextInputType.number,
                            autoFocus: true,
                            onCompleted: (String value) {
                              setState(() {
                                code = value;
                              });
                              cubit.sendCodeForgetPass(
                                  code: value, email: widget.email);
                            },
                          )),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            textDirection: TextDirection.rtl,
                            children: <Widget>[
                              Text("سيتم ارسال الكود خلال"),
                              Center(
                                child: SlideCountdownClock(
                                  duration: Duration(minutes: 1),
                                  slideDirection: SlideDirection.Down,
                                  tightLabel: true,
                                  separator: ":",
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20)
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
