// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details_model.dart';

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
