import 'package:bashir_village/src/models/aboutVilageModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AboutVilageProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<AboutVillageModel> getAboutVillage() async {
    Map<String, String> headers = {};
    Response response = await _utils.get("about_village", headers: headers);
    if (response.statusCode == 200) {
      print("get About Village data sucsseful");
      return AboutVillageModel.fromJson(response.data);
    } else {
      print("error get About Village data");
      return AboutVillageModel.fromJson(response.data);
    }
  }
}
