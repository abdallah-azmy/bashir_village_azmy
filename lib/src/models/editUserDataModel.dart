// To parse this JSON data, do
//
//     final editUserDataModel = editUserDataModelFromJson(jsonString);

import 'dart:convert';

EditUserDataModel editUserDataModelFromJson(String str) =>
    EditUserDataModel.fromJson(json.decode(str));

String editUserDataModelToJson(EditUserDataModel data) =>
    json.encode(data.toJson());

class EditUserDataModel {
  int mainCode;
  int code;
  Data data;
  List<Error> error;

  EditUserDataModel({
    this.mainCode,
    this.code,
    this.data,
    this.error,
  });

  factory EditUserDataModel.fromJson(Map<String, dynamic> json) =>
      EditUserDataModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        error: json["error"] == null
            ? null
            : List<Error>.from(json["error"].map((x) => Error.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": data.toJson(),
        "error": error,
      };
}

class Data {
  String message;
  String image;
  String key;
  String value;
  Data({
    this.message,
    this.image,
    this.key,
    this.value,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        image: json["image"],
        key: json["key"] == null ? null : json["key"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "image": image,
        "key": key == null ? null : key,
        "value": value == null ? null : value,
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
