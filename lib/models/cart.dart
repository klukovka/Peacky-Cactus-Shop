import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:peacky_cactus_shop/models/cactus_amount_full_info.dart';

import 'cactus_amount_short_info.dart';

part 'cart.g.dart';

@immutable
@JsonSerializable()
class Cart extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final List<CactusAmountFullInfo> products;

  const Cart({
    required this.id,
    required this.products,
  });

  const Cart.empty()
      : id = '',
        products = const [];

  double get costs {
    return products.fold(
      0.0,
      (previousValue, element) {
        return previousValue + element.costs;
      },
    );
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    return _$CartFromJson(json);
  }

  Cart updateProductAmount(CactusAmountShortInfo cactusAmountShortInfo) {
    final products = this.products.map((cactus) {
      if (cactus.cactus.id == cactusAmountShortInfo.cactus) {
        return cactus.copyWith(amount: cactusAmountShortInfo.amount);
      }
      return cactus;
    }).toList();

    return Cart(id: id, products: products);
  }

  Cart removeProduct(String cactusId) {
    final products = this.products
      ..removeWhere((element) => element.cactus.id == cactusId);

    return Cart(id: id, products: products);
  }

  Map<String, dynamic> toJson() => _$CartToJson(this);

  @override
  List<Object> get props => [id, products];
}
