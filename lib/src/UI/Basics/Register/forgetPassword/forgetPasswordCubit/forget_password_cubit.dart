import 'package:bashir_village/src/models/forgetPasswordModel.dart';
import 'package:bashir_village/src/models/resetPasswordModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  ForgetPasswordModel forgetPasswordModel;

  String email;

  forgetPass() {
    emit(ForgetPasswordLoadingState());
    FormData formData = FormData.fromMap({"email": email,});

    _utils.post('forget_password', body: formData).then((value) {
      if (value.statusCode == 200) {
        print('forget_password======Success');
        forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);
      }else{
        print('forget_password======Failed');
        forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);
      }
      emit(ForgetPasswordSuccessState(
          forgetPasswordModel: forgetPasswordModel
      ));
    }).catchError((error) {
      emit(ForgetPasswordErrorState());
    });
  }







  ResetPasswordModel resetPasswordModel;
  String password;
  String passwordConfirmation;

  resetPass(String email) {
    emit(ResetPasswordLoadingState());
    FormData formData = FormData.fromMap({
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,

    });

    _utils.post('user_reset_password', body: formData).then((value) {
      if (value.statusCode == 200) {
        print('user_reset_password======Success');
        resetPasswordModel = ResetPasswordModel.fromJson(value.data);
      }else{
        print('user_reset_password======Failed');
        resetPasswordModel = ResetPasswordModel.fromJson(value.data);
      }
      emit(ResetPasswordSuccessState(
          resetPasswordModel: resetPasswordModel
      ));
    }).catchError((error) {
      emit(ResetPasswordErrorState());
    });
  }






}
