import 'package:bashir_village/src/UI/MainWidgets/toast.dart';
import 'package:bashir_village/src/models/favModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_toFav_state.dart';

class AddToFavCubit extends Cubit<AddToFavState> {
  AddToFavCubit() : super(AddToFavInitial());

  static AddToFavCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  FavModel model;


  addToFavFun({int id}) async {
    emit(AddToFavLoadingState());
    FormData formData = FormData.fromMap({});
    _utils.post('add_to_favrouit/$id', body: formData, ).then((value) {
      if (value.statusCode == 200) {
        print('add_to_favrouit=====Success');
        model = FavModel.fromJson(value.data);
        showToast(
            msg: "تمت الاضافة الي المفضلة بنجاح",
            state: ToastStates.SUCCESS);
        emit(AddToFavSuccessState(model: model));
      } else {
        print('add_to_favrouit=====Failed');
        model = FavModel.fromJson(value.data);
        showToast(msg: model.error[0].value, state: ToastStates.ERROR);
        emit(AddToFavErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(AddToFavErrorState(error: "حدث خطأ ما يرجي اعادة المحاولة"));
    });
  }
}
