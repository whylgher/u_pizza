import 'dart:convert';

import 'package:flutter/foundation.dart';

class PizzasModel {
  String id;
  String name;
  String subtitle;
  String url;
  Map sizePrice;
  String? sale;

  PizzasModel({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.url,
    required this.sizePrice,
    this.sale,
  });

  @override
  String toString() {
    return 'PizzasModel(id: $id, name: $name, subtitle: $subtitle, url: $url, sizePrice: $sizePrice, sale: $sale)';
  }

  PizzasModel copyWith({
    String? id,
    String? name,
    String? subtitle,
    String? url,
    Map? sizePrice,
    String? sale,
  }) {
    return PizzasModel(
      id: id ?? this.id,
      name: name ?? this.name,
      subtitle: subtitle ?? this.subtitle,
      url: url ?? this.url,
      sizePrice: sizePrice ?? this.sizePrice,
      sale: sale ?? this.sale,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'subtitle': subtitle,
      'url': url,
      'size_price': sizePrice,
      'sale': sale,
    };
  }

  factory PizzasModel.fromMap(Map<String, dynamic> map) {
    return PizzasModel(
      id: map['id'] as String,
      name: map['name'] as String,
      subtitle: map['subtitle'] as String,
      url: map['url_img'] as String,
      sizePrice: Map.from(
        (map['size_price'] as Map),
      ),
      sale: map['sale'] != null ? map['sale'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PizzasModel.fromJson(String source) =>
      PizzasModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant PizzasModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.subtitle == subtitle &&
        other.url == url &&
        mapEquals(other.sizePrice, sizePrice) &&
        other.sale == sale;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        subtitle.hashCode ^
        url.hashCode ^
        sizePrice.hashCode ^
        sale.hashCode;
  }
}
