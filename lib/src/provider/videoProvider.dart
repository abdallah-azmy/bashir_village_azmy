import 'package:bashir_village/src/models/videoModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class VideoProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<VideoGallaryModel> getVideo() async {
    Map<String, String> headers = {};
    Response response = await _utils.get("video_galleries", headers: headers);
    if (response.statusCode == 200) {
      print("get video data sucsseful");
      return VideoGallaryModel.fromJson(response.data);
    } else {
      print("error get video data");
      return VideoGallaryModel.fromJson(response.data);
    }
  }
}
