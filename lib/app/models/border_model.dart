import 'dart:convert';

class BorderModel {
  String name;
  double price;
  bool? select;

  BorderModel({
    required this.name,
    required this.price,
    this.select,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'select': select,
    };
  }

  factory BorderModel.fromMap(Map<String, dynamic> map) {
    return BorderModel(
      name: map['name'] as String,
      price: (map['price'] <= 0.01 ? 0.0 : map['price']) as double,
      select: false,
    );
  }

  String toJson() => json.encode(toMap());

  factory BorderModel.fromJson(String source) =>
      BorderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
