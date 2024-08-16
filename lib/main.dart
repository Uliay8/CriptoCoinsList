import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CriptoCurrenciesListApp());
}

class CriptoCurrenciesListApp extends StatelessWidget {
  const CriptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CriptoCurrenciesList',
      theme: ThemeData(
        // primarySwatch: Colors.yellow,
        // primaryColor: Colors.yellow,
        // colorSchemeSeed: Colors.yellowAccent,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        // dividerColor: Colors.white24,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 31, 31, 31),
            centerTitle: true,
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme: TextTheme(
            bodyMedium: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            labelSmall: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            )),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => CriptoScreenList(),
        '/coin': (context) => CriptoCoinScreen(),
      },
    );
  }
}

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
    final theme = Theme.of(context);
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
            return ListTile(
              leading: SvgPicture.asset(
                'assets/svg/bitcoin_logo.svg',
                height: 35,
                width: 35,
              ),
              title: Text(
                coinName,
                style: theme.textTheme.bodyMedium,
              ),
              subtitle: Text(
                "55000\$",
                style: theme.textTheme.labelSmall,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).pushNamed('/coin', arguments: coinName);
              },
            );
          }),
    );
  }
}

class CriptoCoinScreen extends StatefulWidget {
  const CriptoCoinScreen({super.key});

  @override
  State<CriptoCoinScreen> createState() => _CriptoCoinScreenState();
}

class _CriptoCoinScreenState extends State<CriptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String argument');
    coinName = args as String;
    setState(() {});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(coinName ?? '...'),
    ));
  }
}
