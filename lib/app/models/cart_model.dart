import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'additional_model.dart';

class CartModel {
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
      'name': name,
      'img': img,
      'description': description,
      'cut': cut,
      'size': size,
      'border': border,
      'additional': additional.map((x) => x.toMap()).toList(),
      'amountPizzas': amountPizzas,
      'amount': amount,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      name: map['name'] as String,
      img: map['img'] as String,
      description: map['description'] as String,
      cut: map['cut'] as bool,
      size: map['size'] as String,
      border: map['border'] as String,
      additional: map['additional'],
      amountPizzas: map['amountPizzas'] as int,
      amount: map['amount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(name: $name, img: $img, description: $description, cut: $cut, size: $size, border: $border, additional: $additional, amountPizzas: $amountPizzas, amount: $amount)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
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
