// To parse this JSON data, do
//
//     final momentModel = momentModelFromJson(jsonString);

import 'dart:convert';

MomentModel momentModelFromJson(String str) => MomentModel.fromJson(json.decode(str));

String momentModelToJson(MomentModel data) => json.encode(data.toJson());

class MomentModel {
    int mainCode;
    int code;
    List<DatumMoment> data;
    dynamic error;

    MomentModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory MomentModel.fromJson(Map<String, dynamic> json) => MomentModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data: List<DatumMoment>.from(json["data"].map((x) => DatumMoment.fromJson(x))),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
    };
}

class DatumMoment {
    int id;
    int categoryId;
    String category;
    String title;
    String content;
    List<Photo> photos;
    List<Comment> comments;
    int seen;
    DateTime createdAt;

    DatumMoment({
        this.id,
        this.categoryId,
        this.category,
        this.title,
        this.content,
        this.photos,
        this.comments,
        this.seen,
        this.createdAt,
    });

    factory DatumMoment.fromJson(Map<String, dynamic> json) => DatumMoment(
        id: json["id"],
        categoryId: json["category_id"],
        category: json["category"],
        title: json["title"],
        content: json["content"],
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
        seen: json["seen"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "category": category,
        "title": title,
        "content": content,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "seen": seen,
        "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    };
}

class Comment {
    int id;
    int userId;
    String user;
    String comment;
    DateTime createdAt;

    Comment({
        this.id,
        this.userId,
        this.user,
        this.comment,
        this.createdAt,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
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

class Photo {
    String photo;

    Photo({
        this.photo,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "photo": photo,
    };
}
