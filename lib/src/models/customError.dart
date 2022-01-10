class CustomError {
  CustomError({
    this.key,
    this.value,
  });

  String key;
  String value;

  factory CustomError.fromJson(Map<String, dynamic> json) => CustomError(
        key: json["key"] == null ? null : json["key"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "value": value == null ? null : value,
      };
}
