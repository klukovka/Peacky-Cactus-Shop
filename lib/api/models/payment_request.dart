import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_request.g.dart';

@immutable
@JsonSerializable()
class PaymentRequest extends Equatable {
  final String deviceId;
  final String phone;
  final String card;
  final String cardExpMonth;
  final String cardExpYear;
  final String cardCvv;
  final String cardHolderName;

  const PaymentRequest({
    required this.deviceId,
    required this.phone,
    required this.card,
    required this.cardExpMonth,
    required this.cardExpYear,
    required this.cardCvv,
    required this.cardHolderName,
  });

  factory PaymentRequest.fromJson(Map<String, dynamic> json) {
    return _$PaymentRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentRequestToJson(this);

  @override
  List<Object> get props {
    return [
      deviceId,
      phone,
      card,
      cardExpMonth,
      cardExpYear,
      cardCvv,
      cardHolderName,
    ];
  }
}
