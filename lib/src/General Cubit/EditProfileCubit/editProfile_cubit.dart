import 'dart:convert';

import 'package:bashir_village/main.dart';
import 'package:bashir_village/src/Helpers/consts.dart';
import 'package:bashir_village/src/Helpers/route.dart';
import 'package:bashir_village/src/UI/MainWidgets/toast.dart';
import 'package:bashir_village/src/UI/mainPage.dart';
import 'package:bashir_village/src/models/editUserDataModel.dart';
import 'package:bashir_village/src/models/loginModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'editProfile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  EditUserDataModel model;
  String name ;
  String email;
  var image;

  editProfile() async {
    emit(EditProfileLoadingState());
    FormData formData = FormData.fromMap({
      "name": name,
      "email": email,
      "image": image == null ? null : await MultipartFile.fromFile(image.path),
    });
    _utils.post('user_change_date', body: formData, ).then((value) {
      if (value.statusCode == 200) {
        print('user_change_date=====Success');
        model = EditUserDataModel.fromJson(value.data);
        print("0000000000000000000");
        LoginModel userModel = LoginModel.fromJson(json.decode(CacheHelper.getData(key: "userData")))   ;
        print("#######0000000000000000000");
        if(name != null){
          userModel.data[0].name = name ;
        }
        if(email != null){
          userModel.data[0].email = email ;
        }
        if(image != null){
          userModel.data[0].image = model.data.image ;
        }
        print("1111111111111111");
        CacheHelper.saveData(
            key: 'userData', value: json.encode(userModel.toJson()));
        print("222222222222222222222");
        print("User Data" + CacheHelper.getData(key: "userData"));



        showToast(
            msg: "تم تعديل البيانات بنجاح",
            state: ToastStates.SUCCESS);

        pushAndRemoveUntil(navigator.currentContext, MainPage(index: 2,));

        emit(EditProfileSuccessState(model: model));
      } else {
        print('user_change_date=====Failed');
        model = EditUserDataModel.fromJson(value.data);
        showToast(msg: model.error[0].value, state: ToastStates.ERROR);

        emit(EditProfileErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(EditProfileErrorState(error: customError));
    });
  }
}
