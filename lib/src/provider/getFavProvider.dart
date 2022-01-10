import 'package:bashir_village/src/models/getFavModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetFavProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<GetFavModel> getFav(String token) async {
      Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    Response response = await _utils.get("get_favrouit_news", headers: headers);
    if (response.statusCode == 200) {
      print("get fav data sucsseful");
      return GetFavModel.fromJson(response.data);
    } else {
      print("error get fav data");
      return GetFavModel.fromJson(response.data);
    }
  }
}
