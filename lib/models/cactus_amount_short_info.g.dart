// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cactus_amount_short_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CactusAmountShortInfoAdapter extends TypeAdapter<CactusAmountShortInfo> {
  @override
  final int typeId = 0;

  @override
  CactusAmountShortInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CactusAmountShortInfo(
      cactus: fields[0] as String,
      amount: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CactusAmountShortInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.cactus)
      ..writeByte(1)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CactusAmountShortInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CactusAmountShortInfo _$CactusAmountShortInfoFromJson(
        Map<String, dynamic> json) =>
    CactusAmountShortInfo(
      cactus: json['cactus'] as String,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$CactusAmountShortInfoToJson(
        CactusAmountShortInfo instance) =>
    <String, dynamic>{
      'cactus': instance.cactus,
      'amount': instance.amount,
    };
