import 'dart:io';

import 'package:bashir_village/src/models/editUserDataModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EditUserDataProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<EditUserDataModel> changeUserData(
      String token, String name, String email, File image) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    FormData formData = FormData.fromMap({
      "name": name,
      "email": email,
      "image": image == null ? image : await MultipartFile.fromFile(image.path),
    });

    Response response =
        await _utils.post("user_change_date", body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("Change data sucsseful");
      return EditUserDataModel.fromJson(response.data);
    } else {
      print("error error change data");
      return EditUserDataModel.fromJson(response.data);
    }
  }
}
