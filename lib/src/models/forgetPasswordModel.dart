// To parse this JSON data, do
//
//     final forgetPasswordModel = forgetPasswordModelFromJson(jsonString);

import 'dart:convert';

ForgetPasswordModel forgetPasswordModelFromJson(String str) => ForgetPasswordModel.fromJson(json.decode(str));

String forgetPasswordModelToJson(ForgetPasswordModel data) => json.encode(data.toJson());

class ForgetPasswordModel {
    int mainCode;
    int code;
    Data data;
    List<Error> error;

    ForgetPasswordModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) => ForgetPasswordModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        error: json["error"] == null ? null : List<Error>.from(json["error"].map((x) => Error.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": data == null ? null : data.toJson(),
        "error": error == null ? null : List<dynamic>.from(error.map((x) => x.toJson())),
    };
}

class Data {
    String key;
    String value;

    Data({
        this.key,
        this.value,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        key: json["key"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
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
        key: json["key"] == null ? null : json["key"],
        value: json["value"] == null ? null : json["value"],
    );

    Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "value": value == null ? null : value,
    };
}