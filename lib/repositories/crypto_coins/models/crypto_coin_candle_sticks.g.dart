// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_candle_sticks.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinCandleSticksAdapter
    extends TypeAdapter<CryptoCoinCandleSticks> {
  @override
  final int typeId = 2;

  @override
  CryptoCoinCandleSticks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinCandleSticks(
      minLow: fields[0] as double,
      priceRange: fields[1] as double,
      list: (fields[3] as List).cast<CandleStickModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinCandleSticks obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.minLow)
      ..writeByte(1)
      ..write(obj.priceRange)
      ..writeByte(3)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinCandleSticksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
