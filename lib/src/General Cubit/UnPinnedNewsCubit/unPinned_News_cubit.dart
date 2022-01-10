
import 'package:bashir_village/src/models/unPinNewsModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
// import 'package:easycard/src/Models/get/cardsAdvantagesModel.dart';
// import 'package:easycard/src/Repository/appLocalization.dart';
// import 'package:easycard/src/Repository/networkUtlis.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'unPinned_News_state.dart';

class UnPinnedNewsCubit extends Cubit<UnPinnedNewsState> {
  UnPinnedNewsCubit() : super(UnPinnedNewsInitial());

  static UnPinnedNewsCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  UnPinNewsModel model ;


  getUnPinnedNews() async {
    emit(UnPinnedNewsLoadingState());

    _utils.get('un_pinned_news',).then((value) {
      if (value.statusCode == 200) {
        print('un_pinned_news=====Success');
        model = UnPinNewsModel.fromJson(value.data);
        emit(UnPinnedNewsSuccessState(model: model));
      } else {
        print('un_pinned_news=====Failed');
        model = UnPinNewsModel.fromJson(value.data);
        emit(UnPinnedNewsErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(UnPinnedNewsErrorState(error:"حدث خطأ ما ... يرجي اعادة المحاولة"));
    });
  }

}
