part of 'confirm_code_cubit.dart';


abstract class ConfirmCodeState {}

class ConfirmCodeInitial extends ConfirmCodeState {}
class ConfirmCodeLoadingState extends ConfirmCodeState {}
class ConfirmCodeSuccessState extends ConfirmCodeState {
  ConfirmCodeModel confirmResetCodeModel;
  ConfirmCodeSuccessState({this.confirmResetCodeModel});
}
class ConfirmCodeErrorState extends ConfirmCodeState {}

//// register code===============================
// class RegisterConfirmCodeInitial extends ConfirmCodeState {}
// class RegisterConfirmCodeLoadingState extends ConfirmCodeState {}
// class RegisterConfirmCodeSuccessState extends ConfirmCodeState {
//   PhoneVerificationModel phoneVerificationModel;
//   RegisterConfirmCodeSuccessState({this.phoneVerificationModel});
// }
// class RegisterConfirmCodeErrorState extends ConfirmCodeState {}
// // resend code=========================================
//
//
// class ResendCodeLoadingState extends ConfirmCodeState {}
// class ResendCodeSuccessState extends ConfirmCodeState {
//   ForgetPasswordModel resendCodeModel;
//   ResendCodeSuccessState({this.resendCodeModel});
// }
// class ResendCodeErrorState extends ConfirmCodeState {}
// //
// //resetPhoneCode =================
//
// class ResetPhoneCodeLoadingState extends ConfirmCodeState {}
// class ResetPhoneCodeSuccessState extends ConfirmCodeState {
//   ForgetPasswordModel resetCodeModel;
//   var phone;
//   ResetPhoneCodeSuccessState({this.resetCodeModel,this.phone});
// }
// class ResetPhoneCodeErrorState extends ConfirmCodeState {}