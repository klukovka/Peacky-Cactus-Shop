// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cactus_amount_full_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CactusAmountFullInfo _$CactusAmountFullInfoFromJson(
        Map<String, dynamic> json) =>
    CactusAmountFullInfo(
      cactus: Cactus.fromJson(json['cactus'] as Map<String, dynamic>),
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$CactusAmountFullInfoToJson(
        CactusAmountFullInfo instance) =>
    <String, dynamic>{
      'cactus': instance.cactus,
      'amount': instance.amount,
    };
