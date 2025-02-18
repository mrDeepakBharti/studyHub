// To parse this JSON data, do
//
//     final quizLevelResponse = quizLevelResponseFromMap(jsonString);

import 'dart:convert';

QuizLevelResponse quizLevelResponseFromMap(String str) =>
    QuizLevelResponse.fromMap(json.decode(str));

String quizLevelResponseToMap(QuizLevelResponse data) =>
    json.encode(data.toMap());

class QuizLevelResponse {
  int? statusCode;
  bool? success;
  String? message;
  Result? result;

  QuizLevelResponse({
    this.statusCode,
    this.success,
    this.message,
    this.result,
  });

  factory QuizLevelResponse.fromMap(Map<String, dynamic> json) =>
      QuizLevelResponse(
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
  List<QuizLevelData>? quizLevels;

  Result({
    this.quizLevels,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        quizLevels: json["quizLevels"] == null
            ? []
            : List<QuizLevelData>.from(
                json["quizLevels"]!.map((x) => QuizLevelData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "quizLevels": quizLevels == null
            ? []
            : List<dynamic>.from(quizLevels!.map((x) => x.toMap())),
      };
}

class QuizLevelData {
  String? id;
  String? name;
  int? level;
  int? points;
  bool? unlocked;
  int? score;

  QuizLevelData({
    this.id,
    this.name,
    this.level,
    this.points,
    this.unlocked,
    this.score,
  });

  factory QuizLevelData.fromMap(Map<String, dynamic> json) => QuizLevelData(
        id: json["_id"],
        name: json["name"],
        level: json["level"],
        points: json["points"],
        unlocked: json["unlocked"],
        score: json["score"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "level": level,
        "points": points,
        "unlocked": unlocked,
        "score": score,
      };
}
