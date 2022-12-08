// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.createdAt,
    required this.username,
    required this.emailId,
    required this.profileImage,
    required this.userId,
  });

  DateTime createdAt;
  String username;
  String emailId;
  String profileImage;
  String userId;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        createdAt: json["createdAt"],
        username: json["username"],
        emailId: json["emailId"],
        profileImage: json["profileImage"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "username": username,
        "emailId": emailId,
        "profileImage": profileImage,
        "userId": userId,
      };
}
