import 'dart:convert';

class UserModel {
  final String email;
  final String image;
  final Map data;

  UserModel({
    required this.email,
    required this.image,
    required this.data,
  });

  UserModel.empty()
      : email = '',
        image = '',
        data = {};

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'img_url': image,
      'data': data,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      image: map['img_url'] ?? '',
      data: map['data'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
