import 'package:bashir_village/src/models/getNewsById.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetNewsByIdProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<GetNewsIdModel> getNewsById(int id) async {
    Map<String, String> headers = {};
    Response response = await _utils.get("get_news_by_id/$id", headers: headers);
    if (response.statusCode == 200) {
      print("get news data sucsseful");
      return GetNewsIdModel.fromJson(response.data);
    } else {
      print("error get news data");
      return GetNewsIdModel.fromJson(response.data);
    }
  }
}
