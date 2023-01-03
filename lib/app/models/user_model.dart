// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class UserModel {
  final String email;
  final String img_url;
  final Map data;

  UserModel({
    required this.email,
    required this.img_url,
    required this.data,
  });

  UserModel.empty()
      : email = '',
        img_url = '',
        data = {};

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'img_url': img_url,
      'data': data,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      img_url: map['img_url'] ?? '',
      data: map['data'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
