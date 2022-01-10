
import 'package:bashir_village/src/Helpers/consts.dart';
import 'package:bashir_village/src/UI/MainWidgets/toast.dart';
import 'package:bashir_village/src/models/deletFavModel.dart';
import 'package:bashir_village/src/models/getFavModel.dart';
import 'package:bashir_village/src/models/unPinNewsModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fav_News_state.dart';

class FavNewsCubit extends Cubit<FavNewsState> {
  FavNewsCubit() : super(FavNewsInitial());

  static FavNewsCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  GetFavModel model ;


  getFavNews() async {
    emit(FavNewsLoadingState());

    _utils.get('get_favrouit_news',).then((value) {
      if (value.statusCode == 200) {
        print('get_favrouit_news=====Success');
        model = GetFavModel.fromJson(value.data);
        emit(FavNewsSuccessState(model: model));
      } else {
        print('get_favrouit_news=====Failed');
        model = GetFavModel.fromJson(value.data);
        emit(FavNewsErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(FavNewsErrorState(error: customError));
    });
  }



  DeletFavModel _model;
  int indexOfDeletedFav ;

  deleteFavNews({int favId,int index}) async {
    indexOfDeletedFav = index ;
    emit(DeleteFavNewsLoadingState());
    FormData formData = FormData.fromMap({});
    _utils
        .post('user_delete_favrouit/$favId', body: formData, )
        .then((value) {
      if (value.statusCode == 200) {
        print('user_delete_favrouit=====Success');
        _model = DeletFavModel.fromJson(value.data);
        showToast(
            msg: "تم المسح بنجاح",
            state: ToastStates.SUCCESS);
        indexOfDeletedFav = null ;
        emit(DeleteFavNewsSuccessState(model: _model));

        getFavNews();
      } else {
        print('user_delete_favrouit=====Failed >>> ${value.data}');
        _model = DeletFavModel.fromJson(value.data);
        showToast(msg: _model.error[0].value, state: ToastStates.ERROR);
        emit(DeleteFavNewsErrorState(error: _model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(DeleteFavNewsErrorState(error: customError));
    });
  }


}
