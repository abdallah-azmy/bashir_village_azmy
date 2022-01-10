// To parse this JSON data, do
//
//     final unPinNewsModel = unPinNewsModelFromJson(jsonString);

import 'dart:convert';

DeletNotificationModel unPinNewsModelFromJson(String str) => DeletNotificationModel.fromJson(json.decode(str));

String unPinNewsModelToJson(DeletNotificationModel data) => json.encode(data.toJson());

class DeletNotificationModel {
    int mainCode;
    int code;
    List<dynamic> data;
    Error error;

    DeletNotificationModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory DeletNotificationModel.fromJson(Map<String, dynamic> json) => DeletNotificationModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        error: Error.fromJson(json["error"]),
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x)),
        "error": error.toJson(),
    };
}

class Error {
    String key;
    String value;

    Error({
        this.key,
        this.value,
    });

    factory Error.fromJson(Map<String, dynamic> json) => Error(
        key: json["key"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
    };
}
