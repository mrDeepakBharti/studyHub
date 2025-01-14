// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromMap(jsonString);

import 'dart:convert';

CategoriesResponse categoriesResponseFromMap(String str) =>
    CategoriesResponse.fromMap(json.decode(str));

String categoriesResponseToMap(CategoriesResponse data) =>
    json.encode(data.toMap());

class CategoriesResponse {
  int? statusCode;
  bool? success;
  String? message;
  Result? result;

  CategoriesResponse({
    this.statusCode,
    this.success,
    this.message,
    this.result,
  });

  factory CategoriesResponse.fromMap(Map<String, dynamic> json) =>
      CategoriesResponse(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "result": result?.toMap(),
      };
}

class Result {
  List<CategoryData>? categories;

  Result({
    this.categories,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        categories: json["categories"] == null
            ? []
            : List<CategoryData>.from(
                json["categories"]!.map((x) => CategoryData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toMap())),
      };
}

class CategoryData {
  String? id;
  String? name;
  String? categoryClass;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CategoryData({
    this.id,
    this.name,
    this.categoryClass,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CategoryData.fromMap(Map<String, dynamic> json) => CategoryData(
        id: json["_id"],
        name: json["name"],
        categoryClass: json["class"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "class": categoryClass,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
