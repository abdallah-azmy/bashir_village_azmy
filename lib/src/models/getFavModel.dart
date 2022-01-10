// To parse this JSON data, do
//
//     final getFavModel = getFavModelFromJson(jsonString);

import 'dart:convert';

GetFavModel getFavModelFromJson(String str) => GetFavModel.fromJson(json.decode(str));

String getFavModelToJson(GetFavModel data) => json.encode(data.toJson());

class GetFavModel {
    int code;
    List<Datum> data;
    List<Error> error;

    GetFavModel({
        this.code,
        this.data,
        this.error,
    });

    factory GetFavModel.fromJson(Map<String, dynamic> json) => GetFavModel(
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"] == null ? null : List<Error>.from(json["error"].map((x) => Error.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error == null ? null : List<dynamic>.from(error.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    int categoryId;
    String category;
    String title;
    String content;
    List<Photo> photos;
    List<dynamic> comments;
    int seen;
    DateTime createdAt;

    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        category: json["category"] == null ? null : json["category"],
        title: json["title"] == null ? null : json["title"],
        content: json["content"] == null ? null : json["content"],
        photos: json["photos"] == null ? null : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        comments: json["comments"] == null ? null : List<dynamic>.from(json["comments"].map((x) => x)),
        seen: json["seen"] == null ? null : json["seen"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "category_id": categoryId == null ? null : categoryId,
        "category": category == null ? null : category,
        "title": title == null ? null : title,
        "content": content == null ? null : content,
        "photos": photos == null ? null : List<dynamic>.from(photos.map((x) => x.toJson())),
        "comments": comments == null ? null : List<dynamic>.from(comments.map((x) => x)),
        "seen": seen == null ? null : seen,
        "created_at": createdAt == null ? null : "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    };
}

class Photo {
    String photo;

    Photo({
        this.photo,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        photo: json["photo"] == null ? null : json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "photo": photo == null ? null : photo,
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
