import 'package:bashir_village/src/Helpers/consts.dart';
import 'package:bashir_village/src/models/loginModel.dart';
import 'package:bashir_village/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();

  LoginModel loginModel;
  String email;
  String password;
  login() async {
    emit(LoginLoadingState());
    FormData formData = FormData.fromMap({
      "email": email,
      "password": password,
      "device_token": deviceToken,
    });
    _utils.post('login', body: formData).then((value) {
      if (value.statusCode == 200) {
        print('login=====Success');
        loginModel = LoginModel.fromJson(value.data);
      } else {
        print('login=====Failed');
        loginModel = LoginModel.fromJson(value.data);
      }
      emit(LoginSuccessState(loginModel: loginModel));
    }).catchError((error) {
      emit(LoginErrorState());
    });
  }
}
