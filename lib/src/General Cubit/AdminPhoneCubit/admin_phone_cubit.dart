
import 'package:bashir_village/src/Helpers/consts.dart';
import 'package:bashir_village/src/models/aboutVilageModel.dart';
import 'package:bashir_village/src/models/getAdminPhoneModel.dart';
import 'package:bashir_village/src/models/welcomeVillageModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:bloc/bloc.dart';
// import 'package:easycard/src/Models/get/generalDataModel.dart';
// import 'package:easycard/src/Repository/appLocalization.dart';
// import 'package:easycard/src/Repository/cachHelper.dart';
// import 'package:easycard/src/Repository/networkUtlis.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admin_phone_state.dart';

class AdminPhoneCubit extends Cubit<AdminPhoneState> {
  AdminPhoneCubit() : super(AdminPhoneInitial());

  static AdminPhoneCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  GetAdminPhone model ;


  getAdminPhoneData() async {
    emit(AdminPhoneLoadingState());

    _utils.get('admin_phone',).then((value) {
      if (value.statusCode == 200) {
        print('admin_phone=====Success');
        model = GetAdminPhone.fromJson(value.data);
        emit(AdminPhoneSuccessState(model: model));
      } else {
        print('admin_phone=====Failed');
        model = GetAdminPhone.fromJson(value.data);
        emit(AdminPhoneErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(AdminPhoneErrorState(error: customError));
    });
  }

}
