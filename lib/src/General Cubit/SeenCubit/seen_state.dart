part of 'seen_cubit.dart';


abstract class SeenState {}

class SeenInitial extends SeenState {}
class SeenLoadingState extends SeenState {}
class SeenSuccessState extends SeenState {
  SeenModel model;
  SeenSuccessState({this.model});
}
class SeenErrorState extends SeenState {
  final String error;
  SeenErrorState({this.error});
}

