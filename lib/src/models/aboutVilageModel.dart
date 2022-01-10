// To parse this JSON data, do
//
//     final aboutVillageModel = aboutVillageModelFromJson(jsonString);

import 'dart:convert';

AboutVillageModel aboutVillageModelFromJson(String str) => AboutVillageModel.fromJson(json.decode(str));

String aboutVillageModelToJson(AboutVillageModel data) => json.encode(data.toJson());

class AboutVillageModel {
    int mainCode;
    int code;
    List<Datum> data;
    dynamic error;

    AboutVillageModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory AboutVillageModel.fromJson(Map<String, dynamic> json) => AboutVillageModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
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
    int categoryId;
    String category;
    String title;
    String content;
    List<Photo> photos;
    DateTime createdAt;

    Datum({
        this.id,
        this.categoryId,
        this.category,
        this.title,
        this.content,
        this.photos,
        this.createdAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        categoryId: json["category_id"],
        category: json["category"],
        title: json["title"],
        content: json["content"],
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "category": category,
        "title": title,
        "content": content,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
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
