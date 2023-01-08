import 'dart:convert';

class AdditionalModel {
  String name;
  int count;
  double price;

  AdditionalModel({
    required this.name,
    required this.price,
    this.count = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'count': count,
      'price': price,
    };
  }

  factory AdditionalModel.fromMap(Map map) {
    return AdditionalModel(
      name: map['name'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AdditionalModel.fromJson(String source) =>
      AdditionalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AdditionalModel(name: $name, count: $count, price: $price)';
}
