class CandleStickPoint {
  // final double x;
  // final double y;
  //точка center
  //4 точки цены
  final double high;
  final double low;
  final double open;
  final double close;

  CandleStickPoint(
      {required this.high,
      required this.low,
      required this.open,
      required this.close});

  // CandleStickPoint({required this.x, required this.y})
  //     : assert(x >= 0 && x <= 1),
  //       assert(y >= 0 && y <= 1);
}
