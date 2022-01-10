import 'package:bashir_village/main.dart';
import 'package:bashir_village/src/Helpers/route.dart';
import 'package:bashir_village/src/UI/Intro/splash.dart';
import 'package:bashir_village/src/network/cachHelper.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewNetworkUtil with ChangeNotifier {
  static NewNetworkUtil _instance = new NewNetworkUtil.internal();
  double progress = 0.0;
  NewNetworkUtil.internal();
  CancelToken cancelToken = CancelToken();
  factory NewNetworkUtil() => _instance;
  Dio dio = Dio();

  Future<Response> get(String url,
      {Map headers}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Map<String, String> headerss = headers != null
          ? headers
          : {
        "Authorization": "Bearer ${CacheHelper.getData(key: 'token')}",
        "Content-Language": "ar"
      };
      var response;
      try {
        dio.options.baseUrl = "http://bashir.tqnee.com/api/v1/";
//        dio.options.baseUrl = "https://easy-card.site/api/v1/";
        response = await dio.get(url, options: Options(headers: headerss));
      } on DioError catch (e) {
        if (e.response != null) {
          response = e.response;
          print("response of DioError catch for get function 11 : " +
              e.response.toString());
        }
      }
      return handleResponse(response);
    } else {

      // ModalRoute.of(context)?.isCurrent != true
      //     ? Navigator.pop(context)
      //     : print("there is no opened dialogs");

      return Response(
        statusCode: 102,
        data: {
          "mainCode": 0,
          "code": 102,
          "data": null,
          "error": [
            {
              "key": "internet",
              "value": "يرجي التحقق من الاتصال بالانترنت"
            }
          ]
        },
      );
    }
  }

  Future<Response> post(String url,
      {Map headers,
        FormData body,
        encoding,
      }) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Map<String, String> headerss = headers != null
          ? headers
          : {
        "Authorization": "Bearer ${CacheHelper.getData(key: 'token')}",
        "Content-Language": "ar"
      };
      var response;
//      dio.options.baseUrl = "https://easy-card.site/api/v1/";
      dio.options.baseUrl = "http://bashir.tqnee.com/api/v1/";
      try {
        response = await dio.post(
          url,
          data: body,
          // cancelToken: cancelToken,
          options: Options(headers: headerss, requestEncoder: encoding),
          onSendProgress: (int sent, int total) {
            progress = (sent / total) * 100;
            print('progress: $progress ($sent/$total)');
            notifyListeners();
          },
        );
      } on DioError catch (e) {
        if (e.response != null) {
          response = e.response;
          print("response of DioError catch for post function : " + "${e.response}");
        } else {}
      }
      return handleResponse(response);
    } else {
      // ModalRoute.of(context)?.isCurrent != true
      //     ? Navigator.pop(context)
      //     : print("there is no opened dialogs");

      return Response(
        statusCode: 102,
        data: {
          "mainCode": 0,
          "code": 102,
          "data": null,
          "error": [
            {
              "key": "no internet",
              "value": "يرجي التحقق من الاتصال بالانترنت"
            }
          ]
        },
      );
    }
  }

  Future<Response> handleResponse(
      Response response) async {
    print("heree <<<<<<<<<<<<,,");
    progress = 0;
    if (response == null || response.data.runtimeType == String) {
      // ModalRoute.of(context)?.isCurrent != true
      //     ? Navigator.pop(context)
      //     : print("there is no opened dialogs");

      return Response(
        statusCode: 102,
        data: {
          "mainCode": 0,
          "code": 102,
          "data": null,
          "error": [
            {"key": "response here == null", "value": "هناك خطأ .. يرجي اعادة المحاولة"}
          ]
        },
//          requestOptions: null
      );
    } else {
      final int statusCode = response.statusCode;
      print("response in handle response : " + response.toString());
      print("statusCode: " + statusCode.toString());
      if (statusCode >= 200 && statusCode < 300) {
        return response;
      } else if (statusCode == 401) {

//        SharedPreferences preferences = await SharedPreferences.getInstance();
//        preferences.clear();
        CacheHelper.removeData(key: "token");
        CacheHelper.removeData(key: "userData");
//        token = null;
        notifyListeners();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          pushAndRemoveUntil(navigator.currentContext, SplashScreen());
        });
        print("here");

        return Response(
          statusCode: 401,
          data: {
            "mainCode": 0,
            "code": 401,
            "data": null,
            "error": [
              {
                "key": "logged in from another mobile",
                "value": "يرجي تسجيل الدخول مجددا"
              }
            ]
          },
//            requestOptions: null
        );
      } else {
        print("3333333333333333");
        return response;
      }
    }
  }
}
