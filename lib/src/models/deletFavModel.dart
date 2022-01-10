// To parse this JSON data, do
//
//     final favModel = favModelFromJson(jsonString);

import 'dart:convert';

DeletFavModel favModelFromJson(String str) => DeletFavModel.fromJson(json.decode(str));

String favModelToJson(DeletFavModel data) => json.encode(data.toJson());

class DeletFavModel {
    int mainCode;
    int code;
    String data;
    List<Error> error;

    DeletFavModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory DeletFavModel.fromJson(Map<String, dynamic> json) => DeletFavModel(
        mainCode: json["mainCode"] == null ? null : json["mainCode"],
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null ? null : json["data"],
        error: json["error"] == null ? null : List<Error>.from(json["error"].map((x) => Error.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode == null ? null : mainCode,
        "code": code == null ? null : code,
        "data": data == null ? null : data,
        "error": error == null ? null : List<dynamic>.from(error.map((x) => x.toJson())),
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
