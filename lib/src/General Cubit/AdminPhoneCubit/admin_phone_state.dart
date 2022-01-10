part of 'admin_phone_cubit.dart';


abstract class AdminPhoneState {}

class AdminPhoneInitial extends AdminPhoneState {}
class AdminPhoneLoadingState extends AdminPhoneState {}
class AdminPhoneSuccessState extends AdminPhoneState {
  GetAdminPhone model;
  AdminPhoneSuccessState({this.model});
}
class AdminPhoneErrorState extends AdminPhoneState {
  final String error;
  AdminPhoneErrorState({this.error});
}

