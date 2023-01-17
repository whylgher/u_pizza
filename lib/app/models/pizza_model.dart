import 'dart:convert';

class PizzaModel {
  int id;
  String name;
  bool? cut;
  String image;
  String description;
  String category;
  double? regular;
  double? large;
  List borders;
  List additionals;
  int countAdditionals;
  double? amount;

  PizzaModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    this.regular,
    this.large,
    required this.image,
    required this.borders,
    required this.additionals,
    required this.countAdditionals,
    this.cut = true,
    this.amount,
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
      'cut': cut,
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
      cut: map['cut'] ?? true,
      countAdditionals: 0,
    );
  }

  factory PizzaModel.fromMapOrder(Map<String, dynamic> map) {
    return PizzaModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      category: map['category'] ?? '',
      image: map['img'],
      borders: [map['border']],
      additionals: map['additional'],
      amount: map['amount'],
      cut: map['cut'] ?? true,
      countAdditionals: map['amount_pizzas'],
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
        cut: false,
        countAdditionals: 0);
  }

  String toJson() => json.encode(toMap());

  factory PizzaModel.fromJson(String source) =>
      PizzaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PizzaModel(id: $id, name: $name, name: $cut, description: $description, category: $category, regular: $regular, large: $large, image: $image, borders: $borders, additionals: $additionals, countAdditionals: $countAdditionals)';
  }
}
