import 'dart:convert';

import 'package:bashir_village/src/models/loginModel.dart';
// import 'package:easycard/src/Models/auth/LoginModel.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    print('Shared Init Working');
  }

  static LoginModel getUserData(){
    final userJson = CacheHelper.getData(key: 'userData');
    return userJson == null?null: LoginModel.fromJson(jsonDecode(userJson));
  }


  static Future<bool> saveData(
      {@required String key, @required dynamic value}) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);

    return await sharedPreferences.setDouble(key, value);
  }

  static dynamic getData({@required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({@required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> clearAll()async{
    return await sharedPreferences.clear();

  }

}
