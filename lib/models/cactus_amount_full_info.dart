import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:peacky_cactus_shop/models/cactus.dart';

part 'cactus_amount_full_info.g.dart';

@immutable
@JsonSerializable()
class CactusAmountFullInfo extends Equatable {
  final Cactus cactus;
  final int amount;

  const CactusAmountFullInfo({
    required this.cactus,
    required this.amount,
  });

  factory CactusAmountFullInfo.fromJson(Map<String, dynamic> json) {
    return _$CactusAmountFullInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CactusAmountFullInfoToJson(this);

  @override
  List<Object> get props => [cactus, amount];

  double get costs => cactus.cost.roundToDouble() * amount;

  String get costsLabel {
    return '$amount X ${cactus.cost} = $costs UAH';
  }

  CactusAmountFullInfo copyWith({
    Cactus? cactus,
    int? amount,
  }) {
    return CactusAmountFullInfo(
      cactus: cactus ?? this.cactus,
      amount: amount ?? this.amount,
    );
  }
}
