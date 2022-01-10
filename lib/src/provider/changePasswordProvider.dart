import 'package:bashir_village/src/models/contactUsModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChangePasswordProvider with ChangeNotifier{
  NetworkUtil _utils = new NetworkUtil();

  Future<ChangePasswordModel> changePassword(
    String oldPassword,
    String currentPassword,
    String confirmPassword,
    String token,
  ) async {
     Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    FormData formData = FormData.fromMap({
      "current_password": oldPassword,
      "new_password": currentPassword,
      "password_confirmation": confirmPassword,
      
    });

    Response response =
        await _utils.post("change_password", body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("contact sucsseful");
      return ChangePasswordModel.fromJson(response.data);
    } else {
      print("error contact");
      return ChangePasswordModel.fromJson(response.data);
    }
  }
}
