
import 'package:bashir_village/src/models/photoGallaryModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'photo_gallery_state.dart';

class PhotoGalleryCubit extends Cubit<PhotoGalleryState> {
  PhotoGalleryCubit() : super(PhotoGalleryInitial());

  static PhotoGalleryCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  PhotoGallaryModel model;
  List<DatumPhotos> photos = [];


  getPhotoGallery() async {
    emit(PhotoGalleryLoadingState());
    Map<String, String> headers = {};
    _utils.get('photo_galleries',headers: headers).then((value) {
      if (value.statusCode == 200) {
        print('photo_galleries=====Success');
        model = PhotoGallaryModel.fromJson(value.data);
        photos = model.data;
        emit(PhotoGallerySuccessState(model: model));
      } else {
        print('photo_galleries=====Failed');
        model = PhotoGallaryModel.fromJson(value.data);
        // photos = null ;
        emit(PhotoGalleryErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      // photos = null ;
      emit(PhotoGalleryErrorState(error:"حدث خطأ ما ... يرجي اعادة المحاولة"));
    });
  }

}
