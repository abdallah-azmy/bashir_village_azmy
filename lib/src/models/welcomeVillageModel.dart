// To parse this JSON data, do
//
//     final villageWelcomeModel = villageWelcomeModelFromJson(jsonString);

import 'dart:convert';

VillageWelcomeModel villageWelcomeModelFromJson(String str) => VillageWelcomeModel.fromJson(json.decode(str));

String villageWelcomeModelToJson(VillageWelcomeModel data) => json.encode(data.toJson());

class VillageWelcomeModel {
    int mainCode;
    int code;
    Data data;
    dynamic error;

    VillageWelcomeModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory VillageWelcomeModel.fromJson(Map<String, dynamic> json) => VillageWelcomeModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": data.toJson(),
        "error": error,
    };
}

class Data {
    String content;

    Data({
        this.content,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "content": content,
    };
}
