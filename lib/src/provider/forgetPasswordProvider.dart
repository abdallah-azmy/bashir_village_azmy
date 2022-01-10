import 'package:bashir_village/src/models/forgetPasswordModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ForgetPasswordProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<ForgetPasswordModel> forgetPassword(
    String email,
  ) async {
    Map<String, String> headers = {};
    FormData formData = FormData.fromMap({
      "email": email,
    });

    Response response =
        await _utils.post("forget_password", body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("forget password sucsseful");
      return ForgetPasswordModel.fromJson(response.data);
    } else {
      print("error forget password");
      return ForgetPasswordModel.fromJson(response.data);
    }
  }
}
