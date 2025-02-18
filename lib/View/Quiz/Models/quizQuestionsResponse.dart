// To parse this JSON data, do
//
//     final quizQuestionsResponse = quizQuestionsResponseFromMap(jsonString);

import 'dart:convert';

QuizQuestionsResponse quizQuestionsResponseFromMap(String str) =>
    QuizQuestionsResponse.fromMap(json.decode(str));

String quizQuestionsResponseToMap(QuizQuestionsResponse data) =>
    json.encode(data.toMap());

class QuizQuestionsResponse {
  int? statusCode;
  bool? success;
  String? message;
  Result? result;

  QuizQuestionsResponse({
    this.statusCode,
    this.success,
    this.message,
    this.result,
  });

  factory QuizQuestionsResponse.fromMap(Map<String, dynamic> json) =>
      QuizQuestionsResponse(
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
  List<Question>? questions;

  Result({
    this.questions,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        questions: json["questions"] == null
            ? []
            : List<Question>.from(
                json["questions"]!.map((x) => Question.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "questions": questions == null
            ? []
            : List<dynamic>.from(questions!.map((x) => x.toMap())),
      };
}

class Question {
  String? question;
  String? answer;
  List<Option>? options;
  String? id;

  Question({
    this.question,
    this.answer,
    this.options,
    this.id,
  });

  factory Question.fromMap(Map<String, dynamic> json) => Question(
        question: json["question"],
        answer: json["answer"],
        options: json["options"] == null
            ? []
            : List<Option>.from(json["options"]!.map((x) => Option.fromMap(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "question": question,
        "answer": answer,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toMap())),
        "_id": id,
      };
}

class Option {
  int? number;
  String? value;
  String? id;

  Option({
    this.number,
    this.value,
    this.id,
  });

  factory Option.fromMap(Map<String, dynamic> json) => Option(
        number: json["number"],
        value: json["value"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "number": number,
        "value": value,
        "_id": id,
      };
}
