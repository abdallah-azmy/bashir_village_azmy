part of 'village_welcome_cubit.dart';


abstract class VillageWelcomeState {}

class VillageWelcomeInitial extends VillageWelcomeState {}
class VillageWelcomeLoadingState extends VillageWelcomeState {}
class VillageWelcomeSuccessState extends VillageWelcomeState {
  VillageWelcomeModel model;
  VillageWelcomeSuccessState({this.model});
}
class VillageWelcomeErrorState extends VillageWelcomeState {
  final String error;
  VillageWelcomeErrorState({this.error});
}

