import 'package:bashir_village/src/models/contactUsModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ContactUSProvider with ChangeNotifier{
  NetworkUtil _utils = new NetworkUtil();

  Future<ChangePasswordModel> contactUS(
    String title,
    String message,
    String token,
  ) async {
     Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    FormData formData = FormData.fromMap({
      "number": title,
      "message": message,
      
    });

    Response response =
        await _utils.post("contact_us", body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("contact sucsseful");
      return ChangePasswordModel.fromJson(response.data);
    } else {
      print("error contact");
      return ChangePasswordModel.fromJson(response.data);
    }
  }
}
