import 'dart:convert';

import 'package:bashir_village/main.dart';
import 'package:bashir_village/src/Helpers/consts.dart';
import 'package:bashir_village/src/Helpers/route.dart';
import 'package:bashir_village/src/UI/MainWidgets/toast.dart';
import 'package:bashir_village/src/UI/mainPage.dart';
import 'package:bashir_village/src/models/changePasswordModel.dart';
import 'package:bashir_village/src/models/editUserDataModel.dart';
import 'package:bashir_village/src/models/loginModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  ChangePasswordModel model;
  String oldPassword;
  String currentPassword;
  String confirmPassword;

  changePassword() async {
    emit(ChangePasswordLoadingState());
    FormData formData = FormData.fromMap({
      "current_password": oldPassword,
      "new_password": currentPassword,
      "password_confirmation": confirmPassword,
    });
    _utils.post('change_password', body: formData, ).then((value) {
      if (value.statusCode == 200) {
        print('change_password=====Success');
        model = ChangePasswordModel.fromJson(value.data);

        showToast(
            msg: "تم تعديل كلمة المرور بنجاح",
            state: ToastStates.SUCCESS);

        pushAndRemoveUntil(navigator.currentContext, MainPage(index: 2,));

        emit(ChangePasswordSuccessState(model: model));
      } else {
        print('change_password=====Failed');
        model = ChangePasswordModel.fromJson(value.data);
        showToast(msg: model.error[0].value, state: ToastStates.ERROR);

        emit(ChangePasswordErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(ChangePasswordErrorState(error: customError));
    });
  }
}
