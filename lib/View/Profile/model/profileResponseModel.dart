// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromMap(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromMap(String str) =>
    ProfileResponse.fromMap(json.decode(str));

String profileResponseToMap(ProfileResponse data) => json.encode(data.toMap());

class ProfileResponse {
  int? statusCode;
  bool? success;
  String? message;
  profileData? result;

  ProfileResponse({
    this.statusCode,
    this.success,
    this.message,
    this.result,
  });

  factory ProfileResponse.fromMap(Map<String, dynamic> json) => ProfileResponse(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        result:
            json["result"] == null ? null : profileData.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "result": result?.toMap(),
      };
}

class profileData {
  User? user;
  Achievements? achievements;

  profileData({
    this.user,
    this.achievements,
  });

  factory profileData.fromMap(Map<String, dynamic> json) => profileData(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        achievements: json["achievements"] == null
            ? null
            : Achievements.fromMap(json["achievements"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "achievements": achievements?.toMap(),
      };
}

class Achievements {
  List<dynamic>? expert;
  List<dynamic>? gold;
  List<dynamic>? silver;
  List<dynamic>? bronze;

  Achievements({
    this.expert,
    this.gold,
    this.silver,
    this.bronze,
  });

  factory Achievements.fromMap(Map<String, dynamic> json) => Achievements(
        expert: json["Expert"] == null
            ? []
            : List<dynamic>.from(json["Expert"]!.map((x) => x)),
        gold: json["Gold"] == null
            ? []
            : List<dynamic>.from(json["Gold"]!.map((x) => x)),
        silver: json["Silver"] == null
            ? []
            : List<dynamic>.from(json["Silver"]!.map((x) => x)),
        bronze: json["Bronze"] == null
            ? []
            : List<dynamic>.from(json["Bronze"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "Expert":
            expert == null ? [] : List<dynamic>.from(expert!.map((x) => x)),
        "Gold": gold == null ? [] : List<dynamic>.from(gold!.map((x) => x)),
        "Silver":
            silver == null ? [] : List<dynamic>.from(silver!.map((x) => x)),
        "Bronze":
            bronze == null ? [] : List<dynamic>.from(bronze!.map((x) => x)),
      };
}

class User {
  String? email;
  String? name;
  String? profileUrl;
  int? quizCount;
  int? accuracy;
  int? points;
  List<dynamic>? recentActivity;
  List<String>? interests;
  String? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? bio;
  String? education;

  User({
    this.email,
    this.name,
    this.profileUrl,
    this.quizCount,
    this.accuracy,
    this.points,
    this.recentActivity,
    this.interests,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.bio,
    this.education,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        email: json["email"],
        name: json["name"],
        profileUrl: json["profileUrl"],
        quizCount: json["quizCount"],
        accuracy: json["accuracy"],
        points: json["points"],
        recentActivity: json["recentActivity"] == null
            ? []
            : List<dynamic>.from(json["recentActivity"]!.map((x) => x)),
        interests: json["interests"] == null
            ? []
            : List<String>.from(json["interests"]!.map((x) => x)),
        category: json["category"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        bio: json["bio"],
        education: json["education"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "name": name,
        "profileUrl": profileUrl,
        "quizCount": quizCount,
        "accuracy": accuracy,
        "points": points,
        "recentActivity": recentActivity == null
            ? []
            : List<dynamic>.from(recentActivity!.map((x) => x)),
        "interests": interests == null
            ? []
            : List<dynamic>.from(interests!.map((x) => x)),
        "category": category,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "bio": bio,
        "education": education,
      };
}
