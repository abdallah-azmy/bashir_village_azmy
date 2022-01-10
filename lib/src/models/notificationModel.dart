// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    int mainCode;
    int code;
    List<DatumNotifications> data;
    List<Error> error;

    NotificationModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data: json["data"] == null ? null : List<DatumNotifications>.from(json["data"].map((x) => DatumNotifications.fromJson(x))),
        error: json["error"] == null ? null : List<Error>.from(json["error"].map((x) => Error.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
    };
}

class DatumNotifications {
    int id;
    int userId;
    int newsId;
    String type;
    String title;
    String message;
    DateTime createdAt;
    DateTime updatedAt;

    DatumNotifications({
        this.id,
        this.userId,
        this.newsId,
        this.type,
        this.title,
        this.message,
        this.createdAt,
        this.updatedAt,
    });

    factory DatumNotifications.fromJson(Map<String, dynamic> json) => DatumNotifications(
        id: json["id"],
        userId: json["user_id"],
        newsId: json["news_id"],
        type: json["type"],
        title: json["title"],
        message: json["message"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "news_id": newsId,
        "type": type,
        "title": title,
        "message": message,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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