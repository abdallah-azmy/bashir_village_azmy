// To parse this JSON data, do
//
//     final addCommentModel = addCommentModelFromJson(jsonString);

import 'dart:convert';

AddCommentModel addCommentModelFromJson(String str) => AddCommentModel.fromJson(json.decode(str));

String addCommentModelToJson(AddCommentModel data) => json.encode(data.toJson());

class AddCommentModel {
    int mainCode;
    int code;
    List<Datum> data;
    List<Data> error;

    AddCommentModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory AddCommentModel.fromJson(Map<String, dynamic> json) => AddCommentModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data:json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"] == null ? null : List<Data>.from(json["error"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
    };
}

class Datum {
    int id;
    int userId;
    String user;
    String comment;
    DateTime createdAt;

    Datum({
        this.id,
        this.userId,
        this.user,
        this.comment,
        this.createdAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        user: json["user"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user": user,
        "comment": comment,
        "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
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
        key: json["key"] == null ? null : json["key"],
        value: json["value"] == null ? null : json["value"],
    );

    Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "value": value == null ? null : value,
    };
}

