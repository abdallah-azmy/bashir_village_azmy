part of 'photo_gallery_cubit.dart';


abstract class PhotoGalleryState {}

class PhotoGalleryInitial extends PhotoGalleryState {}
class PhotoGalleryLoadingState extends PhotoGalleryState {}
class PhotoGallerySuccessState extends PhotoGalleryState {
  PhotoGallaryModel model;
  PhotoGallerySuccessState({this.model});
}
class PhotoGalleryErrorState extends PhotoGalleryState {
  final String error;
  PhotoGalleryErrorState({this.error});
}

