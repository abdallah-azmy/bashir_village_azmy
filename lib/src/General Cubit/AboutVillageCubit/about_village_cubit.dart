
import 'package:bashir_village/src/Helpers/consts.dart';
import 'package:bashir_village/src/models/aboutVilageModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'about_village_state.dart';

class AboutVillageCubit extends Cubit<AboutVillageState> {
  AboutVillageCubit() : super(AboutVillageInitial());

  static AboutVillageCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  AboutVillageModel model ;


  getAboutVillageData() async {
    emit(AboutVillageLoadingState());

    _utils.get('about_village',).then((value) {
      if (value.statusCode == 200) {
        print('about_village=====Success');
        model = AboutVillageModel.fromJson(value.data);
        emit(AboutVillageSuccessState(model: model));
      } else {
        print('about_village=====Failed');
        model = AboutVillageModel.fromJson(value.data);
        emit(AboutVillageErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(AboutVillageErrorState(error: customError));
    });
  }

}
