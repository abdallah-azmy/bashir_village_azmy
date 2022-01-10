import 'package:bashir_village/src/models/getCommentsByIDModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetCommentsByIdProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<GetCommentByIddModel> getCommentssById(int id,String token) async {
      Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    Response response = await _utils.get("get_comment_by_id/$id", headers: headers);
    if (response.statusCode == 200) {
      print("get Comments data sucsseful");
      return GetCommentByIddModel.fromJson(response.data);
    } else {
      print("error get Comments data");
      return GetCommentByIddModel.fromJson(response.data);
    }
  }
}
