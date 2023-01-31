import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:peacky_cactus_shop/models/cactus_amount_short_info.dart';

part 'update_cart_request.g.dart';

@immutable
@JsonSerializable()
class UpdateCartRequest extends Equatable {
  final String deviceId;
  final List<CactusAmountShortInfo> products;

  const UpdateCartRequest({
    required this.deviceId,
    required this.products,
  });

  factory UpdateCartRequest.fromJson(Map<String, dynamic> json) {
    return _$UpdateCartRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateCartRequestToJson(this);

  @override
  List<Object> get props => [deviceId, products];
}
