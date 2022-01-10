import 'package:bashir_village/src/models/resetPasswordModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ResetPasswordProvider with ChangeNotifier{
  NetworkUtil _utils = new NetworkUtil();

  Future<ResetPasswordModel> resetPassword(
    String email,
    String password,
    String confirmPassword,
  ) async {
    Map<String, String> headers = {};
    FormData formData = FormData.fromMap({
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword,
    });

    Response response =
        await _utils.post("user_reset_password", body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("reset sucsseful");
      return ResetPasswordModel.fromJson(response.data);
    } else {
      print("error reset");
      return ResetPasswordModel.fromJson(response.data);
    }
  }
}
