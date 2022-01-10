import 'package:bashir_village/src/models/deletNotificationModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DeletNotificationProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<DeletNotificationModel> deletNot(String token, int id) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    FormData formData = FormData.fromMap({});

    Response response = await _utils.post("delete_Notifications/$id",
        body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("add seen data sucsseful");
      return DeletNotificationModel.fromJson(response.data);
    } else {
      print("error add seen data");
      return DeletNotificationModel.fromJson(response.data);
    }
  }
}
