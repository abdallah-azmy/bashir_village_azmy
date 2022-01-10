import 'package:bashir_village/src/Helpers/route.dart';
import 'package:bashir_village/src/UI/Basics/Register/Login/login.dart';
import 'package:bashir_village/src/UI/Basics/Register/forgetPassword/forgetPasswordCubit/forget_password_cubit.dart';
import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/MainWidgets/customLinearLoading.dart';
import 'package:bashir_village/src/UI/MainWidgets/customTextField.dart';
import 'package:bashir_village/src/UI/MainWidgets/toast.dart';
import 'package:bashir_village/src/provider/resetPasswordProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  final String email;

  const ResetPassword({Key key, this.email}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String password;
  String confirmPassword;
  bool _load = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("اعادة تعيين كلمة السر"),
          centerTitle: true,
          leading: Container(),
        ),
        body: BlocConsumer<ForgetPasswordCubit,ForgetPasswordState>(
          listener: (context, state) {
            if(state is ResetPasswordSuccessState){
              if(state.resetPasswordModel.code ==200){
                showToast(msg: state.resetPasswordModel.data, state: ToastStates.SUCCESS);
                Future.delayed(Duration(milliseconds: 400),(){
                  pushAndRemoveUntil(context, LoginPage());
                });
              }else{
                showToast(msg: state.resetPasswordModel.error[0].value, state: ToastStates.ERROR);
              }
            }
          },
          builder: (context,state){
            var cubit = ForgetPasswordCubit.get(context);
            return ListView(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                CustomTextField(
                    label: '',
                    icon: Icons.phone,
                    maxLines: 1,
                    hint: " كلمة المرور الجديدة",
                    onChang: (value) {
                      cubit.password = value ;
                      password = value;
                    }),
                SizedBox(height: 20),
                CustomTextField(
                  label: '',
                  icon: Icons.phone,
                  maxLines: 1,
                  hint: " تاكيد كلمة المرور",
                  onChang: (value) {
                    cubit.passwordConfirmation = value ;
                    setState(() {
                      confirmPassword = value;
                    });
                  },
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 20),
                  child: (state is ResetPasswordLoadingState) ?
                  CustomLinearLoading(horizontalPadding: 0,)
                      : CustomBtn(
                    color: Theme.of(context).primaryColor,
                    text: 'حفظ كلمة المرور',
                    onTap: () {
                      cubit.resetPass(widget.email);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }


}
