// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'drink_model.dart';
import 'pizza_model.dart';

class OrderModel {
  int id;
  String name;
  String description;
  String status;
  double amount;
  double tax;
  double total;
  List<dynamic> order;
  List<dynamic> drink;

  OrderModel({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.amount,
    required this.tax,
    required this.total,
    required this.order,
    required this.drink,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'status': status,
      'amount': amount,
      'tax': tax,
      'total': total,
      'order': order.map((x) => x.toMap()).toList(),
      'drink': drink.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      status: map['status'] as String,
      amount: map['amount'] as double,
      tax: map['tax'] as double,
      total: map['total'] as double,
      order: map['order'].map((e) => PizzaModel.fromMapOrder(e)).toList(),
      drink: map['drink'].map((e) => DrinkModel.fromMapOrder(e)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, name: $name, description: $description, status: $status, amount: $amount, tax: $tax, total: $total, order: $order, drink: $drink)';
  }
}
