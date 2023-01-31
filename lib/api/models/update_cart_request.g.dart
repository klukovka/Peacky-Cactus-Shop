// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartRequest _$UpdateCartRequestFromJson(Map<String, dynamic> json) =>
    UpdateCartRequest(
      deviceId: json['deviceId'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => CactusAmountShortInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdateCartRequestToJson(UpdateCartRequest instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'products': instance.products,
    };
