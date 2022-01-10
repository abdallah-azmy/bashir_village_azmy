
import 'package:bashir_village/src/models/addCommentModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddCommentProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<AddCommentModel> addComment(String token,String comment,int id) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    FormData formData =
        FormData.fromMap({"comment": comment, });

    Response response =
        await _utils.post("user_add_comment/$id", body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("add comment data sucsseful");
      return AddCommentModel.fromJson(response.data);
    } else {
      print("error add comment data");
      return AddCommentModel.fromJson(response.data);
    }
  }
}
