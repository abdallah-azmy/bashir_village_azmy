// import 'package:bashir_village/src/models/getAdminPhoneModel.dart';
// import 'package:bashir_village/src/network/NetworkUtlis.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// class GetAdminPoneProvider with ChangeNotifier {
//   NetworkUtil _utils = new NetworkUtil();
//
//   Future<GetAdminPhone> getAdminPhone() async {
//     Map<String, String> headers = {};
//     Response response = await _utils.get("admin_phone", headers: headers);
//     if (response.statusCode == 200) {
//       print("get phone data sucsseful");
//       return GetAdminPhone.fromJson(response.data);
//     } else {
//       print("error get phone data");
//       return GetAdminPhone.fromJson(response.data);
//     }
//   }
// }
