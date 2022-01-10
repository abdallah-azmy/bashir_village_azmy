// To parse this JSON data, do
//
//     final videoGallaryModel = videoGallaryModelFromJson(jsonString);

import 'dart:convert';


VideoGallaryModel videoGallaryModelFromJson(String str) => VideoGallaryModel.fromJson(json.decode(str));

String videoGallaryModelToJson(VideoGallaryModel data) => json.encode(data.toJson());

class VideoGallaryModel {
    int mainCode;
    int code;
    List<DatumVideo> data;
    List<Data> error;

    VideoGallaryModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory VideoGallaryModel.fromJson(Map<String, dynamic> json) => VideoGallaryModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<DatumVideo>.from(json["data"].map((x) => DatumVideo.fromJson(x))),
        error: json["error"] == null ? null : List<Data>.from(json["error"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
    };
}

class DatumVideo {
    int id;
    int categoryId;
    String category;
    String title;
    List<VideoLink> videoLink;
    DateTime createdAt;

    DatumVideo({
        this.id,
        this.categoryId,
        this.category,
        this.title,
        this.videoLink,
        this.createdAt,
    });

    factory DatumVideo.fromJson(Map<String, dynamic> json) => DatumVideo(
        id: json["id"],
        categoryId: json["category_id"],
        category: json["category"],
        title: json["title"],
        videoLink: List<VideoLink>.from(json["video_link"].map((x) => VideoLink.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "category": category,
        "title": title,
        "video_link": List<dynamic>.from(videoLink.map((x) => x.toJson())),
        "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    };
}

class VideoLink {
    String videoLink;

    VideoLink({
        this.videoLink,
    });

    factory VideoLink.fromJson(Map<String, dynamic> json) => VideoLink(
        videoLink: json["video_link"],
    );

    Map<String, dynamic> toJson() => {
        "video_link": videoLink,
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
