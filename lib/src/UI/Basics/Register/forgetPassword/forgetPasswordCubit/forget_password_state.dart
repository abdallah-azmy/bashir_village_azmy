part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ForgetPasswordLoadingState extends ForgetPasswordState {}
class ForgetPasswordSuccessState extends ForgetPasswordState {
  ForgetPasswordModel forgetPasswordModel;
  ForgetPasswordSuccessState({this.forgetPasswordModel});
}
class ForgetPasswordErrorState extends ForgetPasswordState {}

class ResetPasswordInitial extends ForgetPasswordState {}
class ResetPasswordLoadingState extends ForgetPasswordState {}
class ResetPasswordSuccessState extends ForgetPasswordState {
  ResetPasswordModel resetPasswordModel;
  ResetPasswordSuccessState({this.resetPasswordModel});
}
class ResetPasswordErrorState extends ForgetPasswordState {}
