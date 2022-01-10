part of 'about_village_cubit.dart';


abstract class AboutVillageState {}

class AboutVillageInitial extends AboutVillageState {}
class AboutVillageLoadingState extends AboutVillageState {}
class AboutVillageSuccessState extends AboutVillageState {
  var model;
  AboutVillageSuccessState({this.model});
}
class AboutVillageErrorState extends AboutVillageState {
  final String error;
  AboutVillageErrorState({this.error});
}

