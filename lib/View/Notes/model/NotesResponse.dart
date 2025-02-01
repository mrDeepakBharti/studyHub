// To parse this JSON data, do
//
//     final notesResponse = notesResponseFromMap(jsonString);

import 'dart:convert';

NotesResponse notesResponseFromMap(String str) =>
    NotesResponse.fromMap(json.decode(str));

String notesResponseToMap(NotesResponse data) => json.encode(data.toMap());

class NotesResponse {
  int? statusCode;
  bool? success;
  String? message;
  NotesData? result;

  NotesResponse({
    this.statusCode,
    this.success,
    this.message,
    this.result,
  });

  factory NotesResponse.fromMap(Map<String, dynamic> json) => NotesResponse(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        result:
            json["result"] == null ? null : NotesData.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "result": result?.toMap(),
      };
}

class NotesData {
  List<Datum>? data;

  NotesData({
    this.data,
  });

  factory NotesData.fromMap(Map<String, dynamic> json) => NotesData(
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
  double? fileSize;
  String? chapterName;

  Book({
    this.id,
    this.title,
    this.fileUrl,
    this.fileSize,
    this.chapterName,
  });

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        id: json["_id"],
        title: json["title"],
        fileUrl: json["fileUrl"],
        fileSize: json["fileSize"]?.toDouble(),
        chapterName: json["chapterName"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "fileUrl": fileUrl,
        "fileSize": fileSize,
        "chapterName": chapterName,
      };
}
