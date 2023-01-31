// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cactus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cactus _$CactusFromJson(Map<String, dynamic> json) => Cactus(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      cost: (json['cost'] as num).toDouble(),
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$CactusToJson(Cactus instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'cost': instance.cost,
      'amount': instance.amount,
    };
