import 'package:bashir_village/src/models/unPinNewsModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UnPinNewsProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();
  UnPinNewsModel model;
  Future<UnPinNewsModel> getUnPinNews() async {
    Map<String, String> headers = {};
    Response response = await _utils.get("un_pinned_news", headers: headers);
    if (response.statusCode == 200) {
      print("get  un Pin News data sucsseful");
      model = UnPinNewsModel.fromJson(response.data);

      return UnPinNewsModel.fromJson(response.data);
    } else {
      print("error get un Pin News data");
      model = UnPinNewsModel.fromJson(response.data);

      return UnPinNewsModel.fromJson(response.data);
    }
  }
}
