import 'package:bashir_village/src/models/welcomeVillageModel.dart';
import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WelcomeVillageProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();

  Future<VillageWelcomeModel> getwelcome() async {
    Map<String, String> headers = {};
    Response response = await _utils.get("knowledge_village_welcome", headers: headers);
    if (response.statusCode == 200) {
      print("get Village WelcomeModel  data sucsseful");
      return VillageWelcomeModel.fromJson(response.data);
    } else {
      print("error get Village WelcomeModel data");
      return VillageWelcomeModel.fromJson(response.data);
    }
  }
}
