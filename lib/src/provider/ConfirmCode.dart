import 'package:bashir_village/src/models/ConfirmCodeModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ConfirmCodeProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<ConfirmCodeModel> confirmCode(
    String email,
    String code,
  ) async {
    Map<String, String> headers = {};
    FormData formData = FormData.fromMap({
      "email": email,
      "code": code,
    });

    Response response =
        await _utils.post("confirm_reset_code", body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("confirm sucsseful");
      return ConfirmCodeModel.fromJson(response.data);
    } else {
      print("error confeirm");
      return ConfirmCodeModel.fromJson(response.data);
    }
  }
}
