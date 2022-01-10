part of 'contactUs_cubit.dart';


abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}
class ContactUsLoadingState extends ContactUsState {}
class ContactUsSuccessState extends ContactUsState {
  var model;
  ContactUsSuccessState({this.model});
}
class ContactUsErrorState extends ContactUsState {
  final String error;
  ContactUsErrorState({this.error});
}

