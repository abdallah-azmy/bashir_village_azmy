
import 'package:bashir_village/src/models/pinNews.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
// import 'package:easycard/src/Models/get/allDataModel.dart';
// import 'package:easycard/src/Repository/appLocalization.dart';
// import 'package:easycard/src/Repository/networkUtlis.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());

  static SliderCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  PinNewsModel model;


  getPinNews() async {
    emit(SliderLoadingState());
    Map<String, String> headers = {};
    _utils.get('pinned_news',headers: headers).then((value) {
      if (value.statusCode == 200) {
        print('pinned_news=====Success');
        model = PinNewsModel.fromJson(value.data);
        emit(SliderSuccessState(model: model));
      } else {
        print('pinned_news=====Failed');
        model = PinNewsModel.fromJson(value.data);
        emit(SliderErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(SliderErrorState(error:"حدث خطأ ما ... يرجي اعادة المحاولة"));
    });
  }

}
