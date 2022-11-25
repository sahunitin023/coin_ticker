import 'package:coin_ticker/price_screen.dart';
import 'package:flutter/material.dart';
import 'themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme(),
      home: const PriceScreen(),
    );
  }
}
