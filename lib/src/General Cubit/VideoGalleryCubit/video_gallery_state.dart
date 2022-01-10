part of 'video_gallery_cubit.dart';


abstract class VideoGalleryState {}

class VideoGalleryInitial extends VideoGalleryState {}
class VideoGalleryLoadingState extends VideoGalleryState {}
class VideoGallerySuccessState extends VideoGalleryState {
  VideoGallaryModel model;
  VideoGallerySuccessState({this.model});
}
class VideoGalleryErrorState extends VideoGalleryState {
  final String error;
  VideoGalleryErrorState({this.error});
}

