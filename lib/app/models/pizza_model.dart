import 'dart:convert';

class PizzaModel {
  int id;
  String name;
  String description;
  String category;
  List prices;
  List image;
  List borders;
  List additionals;
  int countAdditionals;

  PizzaModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.prices,
    required this.image,
    required this.borders,
    required this.additionals,
    required this.countAdditionals,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'prices': prices,
      'image': image,
      'borders': borders,
      'additionals': additionals,
    };
  }

  factory PizzaModel.fromMap(Map<String, dynamic> map) {
    return PizzaModel(
      id: map['pizza']['id'] as int,
      name: map['pizza']['name'] as String,
      description: map['pizza']['description'] as String,
      category: map['pizza']['category'] as String,
      prices: map['pizza']['prices'],
      image: map['pizza']['image'],
      borders: map['borders'],
      additionals: map['additionals'],
      countAdditionals: 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PizzaModel.fromJson(String source) =>
      PizzaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PizzaModel(id: $id, name: $name, description: $description, category: $category, prices: $prices, image: $image, borders: $borders, additionals: $additionals, countAdditionals: $countAdditionals)';
  }
}
