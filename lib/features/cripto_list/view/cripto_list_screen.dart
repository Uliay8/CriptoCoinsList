import 'package:flutter/material.dart';
import '../widgets/widget.dart';

class CriptoScreenList extends StatefulWidget {
  const CriptoScreenList({
    super.key,
  });

  @override
  State<CriptoScreenList> createState() => _CriptoScreenListState();
}

class _CriptoScreenListState extends State<CriptoScreenList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cripto Currencies List",
        ),
      ),
      body: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const Divider(
                color: Colors.white24,
              ),
          itemBuilder: (context, i) {
            const coinName = 'Bitcoin';
            return const CryptoCoinTile(coinName: coinName);
          }),
    );
  }
}
