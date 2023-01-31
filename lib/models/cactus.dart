import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cactus.g.dart';

@immutable
@JsonSerializable()
class Cactus extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String image;
  final double cost;
  final int amount;

  const Cactus({
    required this.id,
    required this.name,
    required this.image,
    required this.cost,
    required this.amount,
  });

  bool get isAvailable => amount > 0;

  factory Cactus.fromJson(Map<String, dynamic> json) {
    return _$CactusFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CactusToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      name,
      image,
      cost,
      amount,
    ];
  }
}
