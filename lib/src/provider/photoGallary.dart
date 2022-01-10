import 'package:bashir_village/src/models/photoGallaryModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PhotoGallaryProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<PhotoGallaryModel> getPhotoGallary() async {
    Map<String, String> headers = {};
    Response response = await _utils.get("photo_galleries", headers: headers);
    if (response.statusCode == 200) {
      print("get About Village data sucsseful");
      return PhotoGallaryModel.fromJson(response.data);
    } else {
      print("error get About Village data");
      return PhotoGallaryModel.fromJson(response.data);
    }
  }
}
