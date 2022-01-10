import 'package:bashir_village/src/models/seenModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SeenProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<SeenModel> getNewsSeen(String token, int id) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    FormData formData = FormData.fromMap({});

    Response response = await _utils.post("seen/$id",
        body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("add seen data sucsseful");
      return SeenModel.fromJson(response.data);
    } else {
      print("error add seen data");
      return SeenModel.fromJson(response.data);
    }
  }
}
