// To parse this JSON data, do
//
//     final confirmCodeModel = confirmCodeModelFromJson(jsonString);

import 'dart:convert';

ConfirmCodeModel confirmCodeModelFromJson(String str) => ConfirmCodeModel.fromJson(json.decode(str));

String confirmCodeModelToJson(ConfirmCodeModel data) => json.encode(data.toJson());

class ConfirmCodeModel {
    int mainCode;
    int code;
    Data data;
    List<Error> error;

    ConfirmCodeModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory ConfirmCodeModel.fromJson(Map<String, dynamic> json) => ConfirmCodeModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        error: json["error"] == null ? null : List<Error>.from(json["error"].map((x) => Error.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": data.toJson(),
        "error": error,
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