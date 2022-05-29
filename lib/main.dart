import 'package:flutter/material.dart';
import 'package:flutter_credit_card/pages/credit_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credit Card',
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CreditCardPage(),
    );
  }
}
