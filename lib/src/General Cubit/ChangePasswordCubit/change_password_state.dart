part of 'change_password_cubit.dart';


abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}
class ChangePasswordLoadingState extends ChangePasswordState {}
class ChangePasswordSuccessState extends ChangePasswordState {
  ChangePasswordModel model;
  ChangePasswordSuccessState({this.model});
}
class ChangePasswordErrorState extends ChangePasswordState {
  final String error;
  ChangePasswordErrorState({this.error});
}

