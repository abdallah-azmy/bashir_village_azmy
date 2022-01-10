part of 'moment_by_moment_cubit.dart';


abstract class MomentByMomentState {}

class MomentByMomentInitial extends MomentByMomentState {}
class MomentByMomentLoadingState extends MomentByMomentState {}
class MomentByMomentSuccessState extends MomentByMomentState {
  MomentModel model;
  MomentByMomentSuccessState({this.model});
}
class MomentByMomentErrorState extends MomentByMomentState {
  final String error;
  MomentByMomentErrorState({this.error});
}

