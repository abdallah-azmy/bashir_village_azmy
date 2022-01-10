part of 'slider_cubit.dart';


abstract class SliderState {}

class SliderInitial extends SliderState {}
class SliderLoadingState extends SliderState {}
class SliderSuccessState extends SliderState {
  PinNewsModel model;
  SliderSuccessState({this.model});
}
class SliderErrorState extends SliderState {
  final String error;
  SliderErrorState({this.error});
}

