import 'package:bashir_village/src/UI/MainWidgets/toast.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bashir_village/src/models/SeenModel.dart';
part 'seen_state.dart';

class SeenCubit extends Cubit<SeenState> {
  SeenCubit() : super(SeenInitial());

  static SeenCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  SeenModel model;


  seenFun({int id}) async {
    emit(SeenLoadingState());
    FormData formData = FormData.fromMap({});
    _utils.post('seen/$id', body: formData, ).then((value) {
      if (value.statusCode == 200) {
        print('seen=====Success');
        model = SeenModel.fromJson(value.data);
        emit(SeenSuccessState(model: model));
      } else {
        print('seen=====Failed');
        model = SeenModel.fromJson(value.data);
        emit(SeenErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(SeenErrorState(error: "حدث خطأ ما يرجي اعادة المحاولة"));
    });
  }
}
