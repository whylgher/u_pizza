import 'dart:convert';

class DrinkModel {
  int id;
  String name;
  double price;
  String image;
  String description;
  int ml;
  double amount;
  int countItem;

  DrinkModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.ml,
    this.amount = 0.0,
    this.countItem = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'ml': ml,
      'amount': amount,
      'countItem': countItem,
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

  @override
  bool operator ==(covariant DrinkModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.image == image &&
        other.description == description &&
        other.ml == ml &&
        other.amount == amount &&
        other.countItem == countItem;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        image.hashCode ^
        description.hashCode ^
        ml.hashCode ^
        amount.hashCode ^
        countItem.hashCode;
  }

  DrinkModel copyWith({
    int? id,
    String? name,
    double? price,
    String? image,
    String? description,
    int? ml,
    double? amount,
    int? countItem,
  }) {
    return DrinkModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
      ml: ml ?? this.ml,
      amount: amount ?? this.amount,
      countItem: countItem ?? this.countItem,
    );
  }

  @override
  String toString() {
    return 'DrinkModel(id: $id, name: $name, price: $price, image: $image, description: $description, ml: $ml, amount: $amount, countItem: $countItem)';
  }
}
