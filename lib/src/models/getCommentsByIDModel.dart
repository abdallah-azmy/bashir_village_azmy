// To parse this JSON data, do
//
//     final changePasswordModel = changePasswordModelFromJson(jsonString);

import 'dart:convert';

GetCommentByIddModel changePasswordModelFromJson(String str) =>
    GetCommentByIddModel.fromJson(json.decode(str));

String changePasswordModelToJson(GetCommentByIddModel data) =>
    json.encode(data.toJson());

class GetCommentByIddModel {
  int mainCode;
  int code;
  List<DatumComments> data;
  List<Error> error;

  GetCommentByIddModel({
    this.mainCode,
    this.code,
    this.data,
    this.error,
  });

  factory GetCommentByIddModel.fromJson(Map<String, dynamic> json) =>
      GetCommentByIddModel(
        mainCode: json["mainCode"] == null ? null : json["mainCode"],
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null
            ? null
            : List<DatumComments>.from(json["data"].map((x) => DatumComments.fromJson(x))),
        error: json["error"] == null
            ? null
            : List<Error>.from(json["error"].map((x) => Error.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mainCode": mainCode == null ? null : mainCode,
        "code": code == null ? null : code,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error == null
            ? null
            : List<dynamic>.from(error.map((x) => x.toJson())),
      };
}

class DatumComments {
  int id;
  int newsPaperId;
  String newsPaper;
  int userId;
  String user;
  String userPhoto;

  String comment;
  DateTime createdAt;

  DatumComments({
    this.id,
    this.newsPaperId,
    this.newsPaper,
    this.userId,
    this.user,
    this.userPhoto,
    this.comment,
    this.createdAt,
  });

  factory DatumComments.fromJson(Map<String, dynamic> json) => DatumComments(
        id: json["id"] == null ? null : json["id"],
        newsPaperId:
            json["news_paper_id"] == null ? null : json["news_paper_id"],
        newsPaper: json["news_paper"] == null ? null : json["news_paper"],
        userId: json["user_id"] == null ? null : json["user_id"],
        user: json["user"] == null ? null : json["user"],
        userPhoto: json["user_photo"] == null ? null : json["user_photo"],
        comment: json["comment"] == null ? null : json["comment"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "news_paper_id": newsPaperId == null ? null : newsPaperId,
        "news_paper": newsPaper == null ? null : newsPaper,
        "user_id": userId == null ? null : userId,
        "user": user == null ? null : user,
        "user_photo": userPhoto == null ? null : userPhoto,
        "comment": comment == null ? null : comment,
        "created_at": createdAt == null
            ? null
            : "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
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
