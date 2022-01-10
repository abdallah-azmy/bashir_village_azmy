// To parse this JSON data, do
//
//     final deviceToken = deviceTokenFromJson(jsonString);

import 'dart:convert';

DeviceTokenModel deviceTokenFromJson(String str) => DeviceTokenModel.fromJson(json.decode(str));

String deviceTokenToJson(DeviceTokenModel data) => json.encode(data.toJson());

class DeviceTokenModel {
    int mainCode;
    int code;
    String data;
    dynamic error;

    DeviceTokenModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory DeviceTokenModel.fromJson(Map<String, dynamic> json) => DeviceTokenModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data: json["data"],
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": data,
        "error": error,
    };
}
