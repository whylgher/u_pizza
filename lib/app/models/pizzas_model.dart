import 'dart:convert';

import '../core/helpers/constants.dart';
import '../core/helpers/environments.dart';

class PizzasModel {
  int id;
  String name;
  String description;
  String image;
  double regular;
  double large;

  PizzasModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.regular,
    required this.large,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'regular': regular,
      'large': large,
    };
  }

  factory PizzasModel.fromMap(Map<String, dynamic> map) {
    return PizzasModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      image: "${Environments.param(Constants.ENV_BASE_URL_KEY)}${map['image']}",
      regular: map['regular'] as double,
      large: map['large'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PizzasModel.fromJson(String source) =>
      PizzasModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
