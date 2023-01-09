import 'dart:convert';

class PizzaModel {
  int id;
  String name;
  String image;
  String description;
  String category;
  double regular;
  double large;
  List borders;
  List additionals;
  int countAdditionals;

  PizzaModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.regular,
    required this.large,
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
      'regular': regular,
      'large': large,
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
      regular: map['pizza']['prices']['regular'],
      large: map['pizza']['prices']['large'],
      image: map['pizza']['image']['image'],
      borders: map['borders'],
      additionals: map['additionals'],
      countAdditionals: 0,
    );
  }

  factory PizzaModel.setNull() {
    return PizzaModel(
        id: 0,
        name: '',
        description: '',
        category: '',
        regular: 0,
        large: 0,
        image: '',
        borders: [],
        additionals: [],
        countAdditionals: 0);
  }

  String toJson() => json.encode(toMap());

  factory PizzaModel.fromJson(String source) =>
      PizzaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PizzaModel(id: $id, name: $name, description: $description, category: $category, regular: $regular, large: $large, image: $image, borders: $borders, additionals: $additionals, countAdditionals: $countAdditionals)';
  }
}
