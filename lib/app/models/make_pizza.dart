import 'dart:convert';

import '../core/helpers/constants.dart';
import '../core/helpers/environments.dart';

class MakePizza {
  final int id;
  final String name;
  final String image;
  final int sauce;
  final int cheese;
  final int topping;
  final int viggie;
  final double price;

  MakePizza({
    required this.id,
    required this.name,
    required this.image,
    required this.sauce,
    required this.cheese,
    required this.topping,
    required this.viggie,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'sauce': sauce,
      'cheese': cheese,
      'topping': topping,
      'viggie': viggie,
      'price': price,
    };
  }

  factory MakePizza.fromMap(Map<String, dynamic> map) {
    return MakePizza(
      id: map['id'] as int,
      name: map['name'] as String,
      image: "${Environments.param(Constants.ENV_BASE_URL_KEY)}${map['image']}",
      sauce: map['sauce'] as int,
      cheese: map['cheese'] as int,
      topping: map['topping'] as int,
      viggie: map['viggie'] as int,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory MakePizza.fromJson(String source) =>
      MakePizza.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MakePizza(id: $id, name: $name, image: $image, sauce: $sauce, cheese: $cheese, topping: $topping, viggie: $viggie, price: $price)';
  }
}
