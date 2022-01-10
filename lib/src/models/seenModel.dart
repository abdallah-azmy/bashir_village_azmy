// To parse this JSON data, do
//
//     final seenModel = seenModelFromJson(jsonString);

import 'dart:convert';

SeenModel seenModelFromJson(String str) => SeenModel.fromJson(json.decode(str));

String seenModelToJson(SeenModel data) => json.encode(data.toJson());

class SeenModel {
    int mainCode;
    int code;
    String data;
    dynamic error;

    SeenModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory SeenModel.fromJson(Map<String, dynamic> json) => SeenModel(
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
