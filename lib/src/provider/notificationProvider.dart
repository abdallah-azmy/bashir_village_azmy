import 'package:bashir_village/src/models/notificationModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NotoficationProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<NotificationModel> getNotification(String token) async {
     Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    Response response = await _utils.get("list-notifications", headers: headers);
    if (response.statusCode == 200) {
      print("get notification data sucsseful");
      return NotificationModel.fromJson(response.data);
    } else {
      print("error get notification data");
      return NotificationModel.fromJson(response.data);
    }
  }
}
