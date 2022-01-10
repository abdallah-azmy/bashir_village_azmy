part of 'add_toFav_cubit.dart';


abstract class AddToFavState {}

class AddToFavInitial extends AddToFavState {}
class AddToFavLoadingState extends AddToFavState {}
class AddToFavSuccessState extends AddToFavState {
  FavModel model;
  AddToFavSuccessState({this.model});
}
class AddToFavErrorState extends AddToFavState {
  final String error;
  AddToFavErrorState({this.error});
}

