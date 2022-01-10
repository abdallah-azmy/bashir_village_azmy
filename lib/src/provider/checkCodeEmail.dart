import 'package:bashir_village/src/models/ConfirmCodeModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CheckCodeEmail with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<ConfirmCodeModel> confirmCode(
      String email, String code, String token) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    FormData formData = FormData.fromMap({
      "email": email,
      "code": code,
    });

    Response response =
        await _utils.post("check_code_email", body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("confirm sucsseful");
      return ConfirmCodeModel.fromJson(response.data);
    } else {
      print("error confeirm");
      return ConfirmCodeModel.fromJson(response.data);
    }
  }
}
