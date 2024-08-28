// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinDetailsModelAdapter
    extends TypeAdapter<CryptoCoinDetailsModel> {
  @override
  final int typeId = 3;

  @override
  CryptoCoinDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinDetailsModel(
      priceUSD: fields[0] as double,
      imageURL: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinDetailsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.priceUSD)
      ..writeByte(1)
      ..write(obj.imageURL);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetailsModel _$CryptoCoinDetailsModelFromJson(
        Map<String, dynamic> json) =>
    CryptoCoinDetailsModel(
      priceUSD: (json['PRICE'] as num).toDouble(),
      imageURL: json['IMAGEURL'] as String,
    );

Map<String, dynamic> _$CryptoCoinDetailsModelToJson(
        CryptoCoinDetailsModel instance) =>
    <String, dynamic>{
      'PRICE': instance.priceUSD,
      'IMAGEURL': instance.imageURL,
    };
