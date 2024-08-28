// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candle_stick_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CandleStickModelAdapter extends TypeAdapter<CandleStickModel> {
  @override
  final int typeId = 1;

  @override
  CandleStickModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CandleStickModel(
      fields[0] as DateTime,
      fields[1] as double,
      fields[2] as double,
      fields[3] as double,
      fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CandleStickModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.high)
      ..writeByte(2)
      ..write(obj.low)
      ..writeByte(3)
      ..write(obj.open)
      ..writeByte(4)
      ..write(obj.close);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CandleStickModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
