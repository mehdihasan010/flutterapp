import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? userName;
  final String? email;
  final String? phone;
  final String? photoUrl;

  UserModel({
    this.userName,
    this.email,
    this.phone,
    this.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json["user_name"],
        email: json["email"],
        phone: json["phone"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "email": email,
        "phone": phone,
        "photoUrl": photoUrl,
      };

  factory UserModel.fromSnapshort(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      userName: data["user_name"],
      email: data["email"],
      phone: data["phone"],
      photoUrl: data["photoUrl"],
    );
  }
}
