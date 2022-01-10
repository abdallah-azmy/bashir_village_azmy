import 'package:bashir_village/src/Helpers/consts.dart';
import 'package:bashir_village/src/models/loginModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier{
  NetworkUtil _utils = new NetworkUtil();

  Future<LoginModel> login(
    String email,
    String password,
  ) async {
    Map<String, String> headers = {};
    FormData formData = FormData.fromMap({
      "email": email,
      "password": password,
      "device_token": deviceToken,
    });

    Response response =
        await _utils.post("login", body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("login sucsseful");
      return LoginModel.fromJson(response.data);
    } else {
      print("error login");
      return LoginModel.fromJson(response.data);
    }
  }
}
