import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

import '../config/hive/hive_type_constants.dart';

part 'cactus_amount_short_info.g.dart';

@immutable
@JsonSerializable()
@HiveType(typeId: HiveTypeConstants.cactusAmountShortInfoTypeId)
class CactusAmountShortInfo extends Equatable {
  @HiveField(0)
  final String cactus;
  @HiveField(1)
  final int amount;

  const CactusAmountShortInfo({
    required this.cactus,
    required this.amount,
  });

  factory CactusAmountShortInfo.fromJson(Map<String, dynamic> json) {
    return _$CactusAmountShortInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CactusAmountShortInfoToJson(this);

  @override
  List<Object> get props => [cactus];

  CactusAmountShortInfo copyWith({
    String? cactus,
    int? amount,
  }) {
    return CactusAmountShortInfo(
      cactus: cactus ?? this.cactus,
      amount: amount ?? this.amount,
    );
  }
}
