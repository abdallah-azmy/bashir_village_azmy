part of 'editProfile_cubit.dart';


abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}
class EditProfileLoadingState extends EditProfileState {}
class EditProfileSuccessState extends EditProfileState {
  var model;
  EditProfileSuccessState({this.model});
}
class EditProfileErrorState extends EditProfileState {
  final String error;
  EditProfileErrorState({this.error});
}

