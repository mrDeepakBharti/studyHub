// To parse this JSON data, do
//
//     final practiceQuizResponse = practiceQuizResponseFromMap(jsonString);

import 'dart:convert';

PracticeQuizResponse practiceQuizResponseFromMap(String str) =>
    PracticeQuizResponse.fromMap(json.decode(str));

String practiceQuizResponseToMap(PracticeQuizResponse data) =>
    json.encode(data.toMap());

class PracticeQuizResponse {
  int? statusCode;
  bool? success;
  String? message;
  Result? result;

  PracticeQuizResponse({
    this.statusCode,
    this.success,
    this.message,
    this.result,
  });

  factory PracticeQuizResponse.fromMap(Map<String, dynamic> json) =>
      PracticeQuizResponse(
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
  List<Datum>? data;

  Result({
    this.data,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  String? id;
  String? title;
  String? subTitle;
  String? datumClass;
  String? icon;
  String? color;
  int? quizCount;

  Datum({
    this.id,
    this.title,
    this.subTitle,
    this.datumClass,
    this.icon,
    this.color,
    this.quizCount,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        subTitle: json["subTitle"],
        datumClass: json["class"],
        icon: json["icon"],
        color: json["color"],
        quizCount: json["quizCount"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "subTitle": subTitle,
        "class": datumClass,
        "icon": icon,
        "color": color,
        "quizCount": quizCount,
      };
}
