// To parse this JSON data, do
//
//     final subjectCategoryResponse = subjectCategoryResponseFromMap(jsonString);

import 'dart:convert';

SubjectCategoryResponse subjectCategoryResponseFromMap(String str) =>
    SubjectCategoryResponse.fromMap(json.decode(str));

String subjectCategoryResponseToMap(SubjectCategoryResponse data) =>
    json.encode(data.toMap());

class SubjectCategoryResponse {
  int? statusCode;
  bool? success;
  String? message;
  Result? result;

  SubjectCategoryResponse({
    this.statusCode,
    this.success,
    this.message,
    this.result,
  });

  factory SubjectCategoryResponse.fromMap(Map<String, dynamic> json) =>
      SubjectCategoryResponse(
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
  List<subjectData>? data;

  Result({
    this.data,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        data: json["data"] == null
            ? []
            : List<subjectData>.from(
                json["data"]!.map((x) => subjectData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class subjectData {
  String? id;
  String? name;

  subjectData({
    this.id,
    this.name,
  });

  factory subjectData.fromMap(Map<String, dynamic> json) => subjectData(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
      };
}
