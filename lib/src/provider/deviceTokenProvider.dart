import 'package:bashir_village/src/network/NetworkUtlis.dart';
import 'package:dio/dio.dart';

class DeviceTokenProvider {
  NetworkUtil _utils = new NetworkUtil();

  Future<bool> getToken(
    String token,
  ) async {
    Map<String, String> headers = {};
    FormData formData = FormData.fromMap({
      "device_token": token,
    });

    Response response =
        await _utils.post("device_token", body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("get token sucsseful");
      return true;
    } else {
      print("error get token");
      return false;
    }
  }
}
