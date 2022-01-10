
import 'package:bashir_village/src/models/videoModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'video_gallery_state.dart';

class VideoGalleryCubit extends Cubit<VideoGalleryState> {
  VideoGalleryCubit() : super(VideoGalleryInitial());

  static VideoGalleryCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  VideoGallaryModel model;
  List<DatumVideo> videos = [];


  getVideoGallery() async {
    emit(VideoGalleryLoadingState());
    Map<String, String> headers = {};
    _utils.get('video_galleries',headers: headers).then((value) {
      if (value.statusCode == 200) {
        print('Video_galleries=====Success');
        model = VideoGallaryModel.fromJson(value.data);
        videos = model.data;
        emit(VideoGallerySuccessState(model: model));
      } else {
        print('Video_galleries=====Failed');
        model = VideoGallaryModel.fromJson(value.data);
        // Videos = null ;
        emit(VideoGalleryErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      // Videos = null ;
      emit(VideoGalleryErrorState(error:"حدث خطأ ما ... يرجي اعادة المحاولة"));
    });
  }

}
