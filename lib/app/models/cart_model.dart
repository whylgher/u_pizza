import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'additional_model.dart';

class CartModel {
  int id;
  String name;
  String img;
  String description;
  bool cut;
  String size;
  String border;
  List<AdditionalModel> additional;
  int amountPizzas;
  double amount;

  CartModel({
    required this.id,
    required this.name,
    required this.img,
    required this.description,
    required this.cut,
    required this.size,
    required this.border,
    required this.additional,
    required this.amountPizzas,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'img': img,
      'description': description,
      'cut': cut,
      'size': size,
      'border': border,
      'additional': additional.map((x) => x.toMap()).toList(),
      'amount_pizzas': amountPizzas,
      'amount': amount,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] as int,
      name: map['name'] as String,
      img: map['img'] as String,
      description: map['description'] as String,
      cut: map['cut'] as bool,
      size: map['size'] as String,
      border: map['border'] as String,
      additional: map['additional'],
      amountPizzas: map['amount_pizzas'] as int,
      amount: map['amount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(id: $id, name: $name, img: $img, description: $description, cut: $cut, size: $size, border: $border, additional: $additional, amountPizzas: $amountPizzas, amount: $amount)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.img == img &&
        other.description == description &&
        other.cut == cut &&
        other.size == size &&
        other.border == border &&
        listEquals(other.additional, additional) &&
        other.amountPizzas == amountPizzas &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        img.hashCode ^
        description.hashCode ^
        cut.hashCode ^
        size.hashCode ^
        border.hashCode ^
        additional.hashCode ^
        amountPizzas.hashCode ^
        amount.hashCode;
  }
}
