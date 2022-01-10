// To parse this JSON data, do
//
//     final forgePasswordCodeModel = forgePasswordCodeModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordModel forgePasswordCodeModelFromJson(String str) =>
    ResetPasswordModel.fromJson(json.decode(str));

String forgePasswordCodeModelToJson(ResetPasswordModel data) =>
    json.encode(data.toJson());

class ResetPasswordModel {
  int mainCode;
  int code;
  String data;
  List<Error> error;

  ResetPasswordModel({
    this.mainCode,
    this.code,
    this.data,
    this.error,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data: json["data"],
        error: json["error"] == null
            ? null
            : List<Error>.from(json["error"].map((x) => Error.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": data,
        "error": error == null
            ? null
            : List<dynamic>.from(error.map((x) => x.toJson())),
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
