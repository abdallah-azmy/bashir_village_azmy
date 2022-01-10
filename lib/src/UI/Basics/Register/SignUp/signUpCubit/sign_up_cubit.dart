import 'dart:io';

import 'package:bashir_village/src/Helpers/consts.dart';
import 'package:bashir_village/src/models/registerModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(BuildContext context)=> BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  RegisterModel registerModel;
  String name;
  String password;
  String email;
  String confirmPassword;
  File photo;

  signUp()async{
    emit(SignUpLoadingState());
    FormData formData = FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation":confirmPassword,
      "device_token": deviceToken,

    });

    _utils.post('register',body: formData)
        .then((value) {
          if(value.statusCode ==200){
            print('signUp========Success');
            registerModel = RegisterModel.fromJson(value.data);
          }else{
            print('signUp========Failed');
            registerModel = RegisterModel.fromJson(value.data);
          }
          emit(SignUpSuccessState(
            registerModel: registerModel
          ));
    })
        .catchError((error){
          emit(SignUpErrorState());
    });
  }




}
