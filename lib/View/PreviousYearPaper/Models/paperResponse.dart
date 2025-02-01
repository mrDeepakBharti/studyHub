// To parse this JSON data, do
//
//     final paperResponse = paperResponseFromMap(jsonString);

import 'dart:convert';

PaperResponse paperResponseFromMap(String str) =>
    PaperResponse.fromMap(json.decode(str));

String paperResponseToMap(PaperResponse data) => json.encode(data.toMap());

class PaperResponse {
  int? statusCode;
  bool? success;
  String? message;
  PaperResult? result;

  PaperResponse({
    this.statusCode,
    this.success,
    this.message,
    this.result,
  });

  factory PaperResponse.fromMap(Map<String, dynamic> json) => PaperResponse(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        result:
            json["result"] == null ? null : PaperResult.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "result": result?.toMap(),
      };
}

class PaperResult {
  List<PapersByYear>? papersByYear;

  PaperResult({
    this.papersByYear,
  });

  factory PaperResult.fromMap(Map<String, dynamic> json) => PaperResult(
        papersByYear: json["papersByYear"] == null
            ? []
            : List<PapersByYear>.from(
                json["papersByYear"]!.map((x) => PapersByYear.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "papersByYear": papersByYear == null
            ? []
            : List<dynamic>.from(papersByYear!.map((x) => x.toMap())),
      };
}

class PapersByYear {
  String? id;
  List<Paper>? papers;

  PapersByYear({
    this.id,
    this.papers,
  });

  factory PapersByYear.fromMap(Map<String, dynamic> json) => PapersByYear(
        id: json["_id"],
        papers: json["papers"] == null
            ? []
            : List<Paper>.from(json["papers"]!.map((x) => Paper.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "papers": papers == null
            ? []
            : List<dynamic>.from(papers!.map((x) => x.toMap())),
      };
}

class Paper {
  String? paperUrl;
  double? paperSize;
  String? paperSet;

  Paper({
    this.paperUrl,
    this.paperSize,
    this.paperSet,
  });

  factory Paper.fromMap(Map<String, dynamic> json) => Paper(
        paperUrl: json["paperUrl"],
        paperSize: json["paperSize"]?.toDouble(),
        paperSet: json["set"],
      );

  Map<String, dynamic> toMap() => {
        "paperUrl": paperUrl,
        "paperSize": paperSize,
        "set": paperSet,
      };
}
