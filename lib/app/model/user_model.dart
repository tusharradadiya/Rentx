// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel(
      {required this.createdAt,
      required this.username,
      required this.emailId,
      required this.profileImage,
      required this.userId,
      required this.phone,
      required this.emailVerified});

  DateTime createdAt;
  String username;
  String emailId;
  String? profileImage;
  String userId;
  String phone;
  bool emailVerified;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        createdAt: json["createdAt"],
        username: json["username"],
        emailId: json["emailId"],
        profileImage: json["profileImage"],
        userId: json["userId"],
        phone: json["phone"],
        emailVerified: json["emailVerified"],
      );

  factory UserModel.fromSnapshot(DocumentSnapshot<Object?> doc) {
    Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
    return UserModel(
      createdAt: map['createdAt'].toDate(),
      username: map['username'] ?? '',
      emailId: map['emailId'] ?? '',
      profileImage: map['profileImage'] ?? '',
      userId: map['userId'] ?? '',
      phone: map['phone'] ?? '',
      emailVerified: map['emailVerified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "username": username,
        "emailId": emailId,
        "profileImage": profileImage,
        "userId": userId,
        "phone": phone,
        "emailVerified": emailVerified,
      };
}
