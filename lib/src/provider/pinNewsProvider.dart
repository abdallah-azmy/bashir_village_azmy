import 'package:bashir_village/src/models/pinNews.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PinNewsProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();
  PinNewsModel model;
  Future<PinNewsModel> getPinNews() async {
    Map<String, String> headers = {};
    Response response = await _utils.get("pinned_news", headers: headers);
    if (response.statusCode == 200) {
      print("get Pin News data sucsseful");
      model = PinNewsModel.fromJson(response.data);
      return PinNewsModel.fromJson(response.data);
    } else {
      print("error get  Pin News data");
      model = PinNewsModel.fromJson(response.data);
      return PinNewsModel.fromJson(response.data);
    }
  }
}
