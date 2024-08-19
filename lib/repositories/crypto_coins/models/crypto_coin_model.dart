import 'package:equatable/equatable.dart';

class CryptoCoinModel extends Equatable {
  final String name;
  final double priceUSD;
  final String imageURL;
  const CryptoCoinModel(this.name, this.priceUSD, this.imageURL);

  @override
  List<Object?> get props => [name, priceUSD, imageURL];
}
