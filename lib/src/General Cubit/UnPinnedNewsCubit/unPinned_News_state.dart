part of 'unPinned_News_cubit.dart';


abstract class UnPinnedNewsState {}

class UnPinnedNewsInitial extends UnPinnedNewsState {}
class UnPinnedNewsLoadingState extends UnPinnedNewsState {}
class UnPinnedNewsSuccessState extends UnPinnedNewsState {
  UnPinNewsModel model;
  UnPinnedNewsSuccessState({this.model});
}
class UnPinnedNewsErrorState extends UnPinnedNewsState {
  final String error;
  UnPinnedNewsErrorState({this.error});
}

