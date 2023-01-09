import 'dart:convert';

class DrinkModel {
  int id;
  String name;
  double price;
  String image;
  String description;
  int ml;

  DrinkModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.ml,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'ml': ml,
    };
  }

  factory DrinkModel.fromMap(Map<String, dynamic> map) {
    return DrinkModel(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as double,
      image: map['image'] as String,
      description: map['description'] as String,
      ml: map['ml'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DrinkModel.fromJson(String source) =>
      DrinkModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
