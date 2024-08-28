import 'package:hive_flutter/hive_flutter.dart';

part 'candle_stick_model.g.dart';

@HiveType(typeId: 1)
class CandleStickModel {
  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final double high;
  @HiveField(2)
  final double low;
  @HiveField(3)
  final double open;
  @HiveField(4)
  final double close;

  CandleStickModel(this.date, this.high, this.low, this.open, this.close);
}
