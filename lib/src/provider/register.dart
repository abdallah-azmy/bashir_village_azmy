import 'package:bashir_village/src/models/registerModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier{
  NetworkUtil _utils = new NetworkUtil();

  Future<RegisterModel> register(
    String name,
    String email,  
    String password,
    String confermPassword,
    String token,
  ) async {
    Map<String, String> headers = {};
    FormData formData = FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation":confermPassword,
     // "device_token": token,
    });

    Response response =
        await _utils.post("register", body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("register sucsseful");
      return RegisterModel.fromJson(response.data);
    } else {
      print("error login");
      return RegisterModel.fromJson(response.data);
    }
  }

}
