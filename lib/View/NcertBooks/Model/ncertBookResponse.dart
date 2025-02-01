// To parse this JSON data, do
//
//     final ncertBookResponse = ncertBookResponseFromMap(jsonString);

import 'dart:convert';

NcertBookResponse ncertBookResponseFromMap(String str) =>
    NcertBookResponse.fromMap(json.decode(str));

String ncertBookResponseToMap(NcertBookResponse data) =>
    json.encode(data.toMap());

class NcertBookResponse {
  int? statusCode;
  bool? success;
  String? message;
  NcertData? result;

  NcertBookResponse({
    this.statusCode,
    this.success,
    this.message,
    this.result,
  });

  factory NcertBookResponse.fromMap(Map<String, dynamic> json) =>
      NcertBookResponse(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        result:
            json["result"] == null ? null : NcertData.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "result": result?.toMap(),
      };
}

class NcertData {
  List<Datum>? data;

  NcertData({
    this.data,
  });

  factory NcertData.fromMap(Map<String, dynamic> json) => NcertData(
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
  String? subjectName;
  String? icon;
  String? color;
  List<Book>? books;

  Datum({
    this.subjectName,
    this.icon,
    this.color,
    this.books,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        subjectName: json["subjectName"],
        icon: json["icon"],
        color: json["color"],
        books: json["books"] == null
            ? []
            : List<Book>.from(json["books"]!.map((x) => Book.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "subjectName": subjectName,
        "icon": icon,
        "color": color,
        "books": books == null
            ? []
            : List<dynamic>.from(books!.map((x) => x.toMap())),
      };
}

class Book {
  String? id;
  String? title;
  String? fileUrl;
  String? fileSize;

  Book({
    this.id,
    this.title,
    this.fileUrl,
    this.fileSize,
  });

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        id: json["_id"],
        title: json["title"],
        fileUrl: json["fileUrl"],
        fileSize: json["fileSize"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "fileUrl": fileUrl,
        "fileSize": fileSize,
      };
}
