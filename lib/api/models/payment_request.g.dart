// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) =>
    PaymentRequest(
      deviceId: json['deviceId'] as String,
      phone: json['phone'] as String,
      card: json['card'] as String,
      cardExpMonth: json['cardExpMonth'] as String,
      cardExpYear: json['cardExpYear'] as String,
      cardCvv: json['cardCvv'] as String,
      cardHolderName: json['cardHolderName'] as String,
    );

Map<String, dynamic> _$PaymentRequestToJson(PaymentRequest instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'phone': instance.phone,
      'card': instance.card,
      'cardExpMonth': instance.cardExpMonth,
      'cardExpYear': instance.cardExpYear,
      'cardCvv': instance.cardCvv,
      'cardHolderName': instance.cardHolderName,
    };
