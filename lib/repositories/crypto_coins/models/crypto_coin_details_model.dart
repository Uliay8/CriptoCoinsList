import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_coin_details_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class CryptoCoinDetailsModel extends Equatable {
  @HiveField(0)
  @JsonKey(name: 'PRICE')
  final double priceUSD;

  @HiveField(1)
  @JsonKey(name: 'IMAGEURL')
  final String imageURL;
  String get fullImageUrl => "https://www.cryptocompare.com/$imageURL";

  const CryptoCoinDetailsModel(
      {required this.priceUSD, required this.imageURL});

  factory CryptoCoinDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$CryptoCoinDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CryptoCoinDetailsModelToJson(this);

  @override
  List<Object?> get props => [priceUSD, imageURL];
}
