// To parse this JSON data, do
//
//     final photoGallaryModel = photoGallaryModelFromJson(jsonString);

import 'dart:convert';

PhotoGallaryModel photoGallaryModelFromJson(String str) => PhotoGallaryModel.fromJson(json.decode(str));

String photoGallaryModelToJson(PhotoGallaryModel data) => json.encode(data.toJson());

class PhotoGallaryModel {
    int mainCode;
    int code;
    List<DatumPhotos> data;
    dynamic error;

    PhotoGallaryModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory PhotoGallaryModel.fromJson(Map<String, dynamic> json) => PhotoGallaryModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<DatumPhotos>.from(json["data"].map((x) => DatumPhotos.fromJson(x))),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
    };
}

class DatumPhotos {
    int id;
    int categoryId;
    String category;
    String title;
    String content;
    List<Photo> photos;
    DateTime createdAt;

    DatumPhotos({
        this.id,
        this.categoryId,
        this.category,
        this.title,
        this.content,
        this.photos,
        this.createdAt,
    });

    factory DatumPhotos.fromJson(Map<String, dynamic> json) => DatumPhotos(
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
    String title;
    String photo;

    Photo({
        this.title,
        this.photo,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        title: json["title"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "photo": photo,
    };
}
