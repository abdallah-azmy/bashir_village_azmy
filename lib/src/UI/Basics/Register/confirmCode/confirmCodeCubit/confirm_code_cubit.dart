import 'package:bashir_village/src/models/ConfirmCodeModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

part 'confirm_code_state.dart';

class ConfirmCodeCubit extends Cubit<ConfirmCodeState> {
  ConfirmCodeCubit() : super(ConfirmCodeInitial());

  static ConfirmCodeCubit get(context) => BlocProvider.of(context);
  NewNetworkUtil _utils = NewNetworkUtil();
  ConfirmCodeModel confirmResetCodeModel;

  sendCodeForgetPass({String email, String code}) async {
    emit(ConfirmCodeLoadingState());
    FormData formData = FormData.fromMap({
      "email": email,
      "code": code,
    });
    await _utils.post('confirm_reset_code', body: formData).then((value) {
      if (value.statusCode == 200) {
        print('confirm-reset-code====Success');
        confirmResetCodeModel = ConfirmCodeModel.fromJson(value.data);
      } else {
        print('confirm-reset-code====Failed');
        confirmResetCodeModel = ConfirmCodeModel.fromJson(value.data);
      }
      emit(ConfirmCodeSuccessState(
          confirmResetCodeModel: confirmResetCodeModel));
    }).catchError((error) {
      emit(ConfirmCodeErrorState());
    });
  }

  // PhoneVerificationModel phoneVerificationModel ;
  //
  // sendCodeForRegister({String phone, String code,context}) async {
  //   emit(RegisterConfirmCodeLoadingState());
  //   FormData formData = FormData.fromMap({
  //     "phone": phone,
  //     "code": code,
  //   });
  //   await _utils.post('phone-verification', body: formData).then((value) {
  //     if (value.statusCode == 200) {
  //       print('phone-verification====Success');
  //       phoneVerificationModel = PhoneVerificationModel.fromJson(value.data);
  //     } else {
  //       print('phone-verification====Failed');
  //       phoneVerificationModel = PhoneVerificationModel.fromJson(value.data);
  //     }
  //     emit(RegisterConfirmCodeSuccessState(
  //         phoneVerificationModel: phoneVerificationModel));
  //   }).catchError((error) {
  //     emit(RegisterConfirmCodeErrorState());
  //   });
  // }

  // ForgetPasswordModel resendCodeModel;
  //
  // resendCode({String phone,context}) async {
  //   emit(ResendCodeLoadingState());
  //   FormData formData = FormData.fromMap({
  //     "phone": phone,
  //   });
  //   await _utils
  //       .post('resend-code', body: formData)
  //       .then((value) {
  //     if (value.statusCode == 200) {
  //       print('resendCode===========Success');
  //       resendCodeModel = ForgetPasswordModel.fromJson(value.data);
  //     } else {
  //       print('resendCode===========Failed');
  //       resendCodeModel = ForgetPasswordModel.fromJson(value.data);
  //     }
  //     emit(ResendCodeSuccessState(
  //         resendCodeModel: resendCodeModel
  //     ));
  //   })
  //       .catchError((error) {
  //     emit(ResendCodeErrorState());
  //   });
  // }

  // ForgetPasswordModel changePhoneModel;
  // codeForChangePhone({String phone, String code,context}) async {
  //   emit(ResetPhoneCodeLoadingState());
  //   FormData formData = FormData.fromMap({
  //     "phone": phone,
  //     "code": code,
  //   });
  //   await _utils.post('check_code_change_phone', body: formData).then((value) {
  //     if (value.statusCode == 200) {
  //       print('check_code_change_phone====Success');
  //       changePhoneModel = ForgetPasswordModel.fromJson(value.data);
  //     } else {
  //       print('check_code_change_phone====Failed');
  //       changePhoneModel = ForgetPasswordModel.fromJson(value.data);
  //     }
  //     emit(ResetPhoneCodeSuccessState(
  //         resetCodeModel: changePhoneModel,
  //         phone:phone
  //     ));
  //   }).catchError((error) {
  //     emit(ResetPhoneCodeErrorState());
  //   });
  // }


}
