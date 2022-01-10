import 'package:bashir_village/src/models/momentModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MomentProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<MomentModel> getMoment() async {
    Map<String, String> headers = {};
    Response response = await _utils.get("moment_by_moment", headers: headers);
    if (response.statusCode == 200) {
      print("get About Village data sucsseful");
      return MomentModel.fromJson(response.data);
    } else {
      print("error get About Village data");
      return MomentModel.fromJson(response.data);
    }
  }
}
