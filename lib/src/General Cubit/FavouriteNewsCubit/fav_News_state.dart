part of 'fav_News_cubit.dart';


abstract class FavNewsState {}

class FavNewsInitial extends FavNewsState {}
class FavNewsLoadingState extends FavNewsState {}
class FavNewsSuccessState extends FavNewsState {
  GetFavModel model;
  FavNewsSuccessState({this.model});
}
class FavNewsErrorState extends FavNewsState {
  final String error;
  FavNewsErrorState({this.error});
}

class DeleteFavNewsLoadingState extends FavNewsState {}
class DeleteFavNewsSuccessState extends FavNewsState {
  var model;
  DeleteFavNewsSuccessState({this.model});
}
class DeleteFavNewsErrorState extends FavNewsState {
  final String error;
  DeleteFavNewsErrorState({this.error});}


