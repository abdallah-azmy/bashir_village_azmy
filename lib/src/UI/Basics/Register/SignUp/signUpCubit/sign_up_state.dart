part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpLoadingState extends SignUpState {}
class SignUpSuccessState extends SignUpState {
  RegisterModel registerModel;
  SignUpSuccessState({this.registerModel});
}
class SignUpErrorState extends SignUpState {}
