import 'package:bashir_village/src/models/deletFavModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DeletFavProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<DeletFavModel> deletFav(String token, int id) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    FormData formData = FormData.fromMap({});

    Response response = await _utils.post("user_delete_favrouit/$id",
        body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("add to fav data sucsseful");
      return DeletFavModel.fromJson(response.data);
    } else {
      print("error add to fav data");
      return DeletFavModel.fromJson(response.data);
    }
  }
}
