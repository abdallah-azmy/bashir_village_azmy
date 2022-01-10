// To parse this JSON data, do
//
//     final getAdminPhone = getAdminPhoneFromJson(jsonString);

import 'dart:convert';

GetAdminPhone getAdminPhoneFromJson(String str) => GetAdminPhone.fromJson(json.decode(str));

String getAdminPhoneToJson(GetAdminPhone data) => json.encode(data.toJson());

class GetAdminPhone {
    int mainCode;
    int code;
    Data data;
    dynamic error;

    GetAdminPhone({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    factory GetAdminPhone.fromJson(Map<String, dynamic> json) => GetAdminPhone(
        mainCode: json["mainCode"] == null ? null : json["mainCode"],
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode == null ? null : mainCode,
        "code": code == null ? null : code,
        "data": data == null ? null : data.toJson(),
        "error": error,
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
