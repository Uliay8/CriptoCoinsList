// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [CryptoCoinScreen]
class CryptoCoinRoute extends PageRouteInfo<CryptoCoinRouteArgs> {
  CryptoCoinRoute({
    Key? key,
    required CryptoCoinModel coin,
    List<PageRouteInfo>? children,
  }) : super(
          CryptoCoinRoute.name,
          args: CryptoCoinRouteArgs(
            key: key,
            coin: coin,
          ),
          initialChildren: children,
        );

  static const String name = 'CryptoCoinRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CryptoCoinRouteArgs>();
      return CryptoCoinScreen(
        key: args.key,
        coin: args.coin,
      );
    },
  );
}

class CryptoCoinRouteArgs {
  const CryptoCoinRouteArgs({
    this.key,
    required this.coin,
  });

  final Key? key;

  final CryptoCoinModel coin;

  @override
  String toString() {
    return 'CryptoCoinRouteArgs{key: $key, coin: $coin}';
  }
}

/// generated route for
/// [CryptoScreenList]
class CryptoRouteList extends PageRouteInfo<void> {
  const CryptoRouteList({List<PageRouteInfo>? children})
      : super(
          CryptoRouteList.name,
          initialChildren: children,
        );

  static const String name = 'CryptoRouteList';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CryptoScreenList();
    },
  );
}
