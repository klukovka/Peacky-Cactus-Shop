import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cactus_amount_full_info.dart';
import 'cart.dart';

part 'order.g.dart';

@immutable
@JsonSerializable()
class Order extends Cart {
  final DateTime date;

  const Order({
    required String id,
    required List<CactusAmountFullInfo> products,
    required this.date,
  }) : super(id: id, products: products);

  factory Order.fromJson(Map<String, dynamic> json) {
    return _$OrderFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  List<Object> get props => [id, products, date];
}
