import 'package:bashir_village/src/General%20Cubit/ChangePasswordCubit/change_password_cubit.dart';
import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/MainWidgets/customLinearLoading.dart';
import 'package:bashir_village/src/UI/MainWidgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class EditPassword extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {

  String oldPassword;
  String currentPassword;
  String confirmPassword;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("تعديل كلمة السر"),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body:
        BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
          builder: (context, state) {
            var cubit = ChangePasswordCubit.get(context);
            return  ListView(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  label: '',
                  icon: Icons.phone,
                  maxLines: 1,
                  hint: " كلمة المرور الحاليه",
                  onChang: (val) {
                    setState(() {
                      oldPassword = val;
                    });
                    cubit.oldPassword = val ;
                  },
                ),
                SizedBox(height: 20), //
                CustomTextField(
                  label: '',
                  icon: Icons.phone,
                  maxLines: 1,
                  hint: " كلمة المرور الجديدة",
                  onChang: (val) {
                    currentPassword = val;
                    cubit.currentPassword = val ;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: '',
                  icon: Icons.phone,
                  maxLines: 1,
                  hint: " تاكيد كلمة المرور",
                  onChang: (val) {
                    confirmPassword = val;
                    cubit.confirmPassword = val ;
                  },
                ),
                SizedBox(height: 20),
                (state is ChangePasswordLoadingState)
                    ? CustomLinearLoading(
                  horizontalPadding: 0,
                )
                    :  Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 20),
                  child: CustomBtn(
                    color: Theme.of(context).primaryColor,
                    text: 'حفظ كلمة المرور',
                    onTap: () {
                      cubit.changePassword();

                    },
                  ),
                ),
              ],
            );
          },
        ))


      );

  }


}
