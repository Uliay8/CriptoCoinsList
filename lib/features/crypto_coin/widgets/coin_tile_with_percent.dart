import 'package:flutter/material.dart';

class CoinTileWithPercent extends StatelessWidget {
  const CoinTileWithPercent(
      {super.key,
      required this.openPeriodPrice,
      required this.closePeriodPrice});

  final double openPeriodPrice;
  final double closePeriodPrice;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percent =
        (closePeriodPrice - openPeriodPrice) / openPeriodPrice * 100;
    final percentString = percent.toStringAsFixed(2);
    final closePeriodPriceString = closePeriodPrice.toStringAsFixed(4);
    return ListTile(
      title: Text(
        "$closePeriodPriceString\$",
        style: theme.textTheme.headlineMedium,
      ),
      trailing: Container(
        padding: const EdgeInsets.all(8.0),
        color: redOrGreen(percent),
        child: Text(
          '$percentString%',
          style: theme.textTheme.labelSmall?.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Color? redOrGreen(double percent) {
    if (percent > 0) {
      return Colors.green[700];
    }
    return Colors.red[800];
  }
}
