import 'package:app_progetto/pages/cartPage.dart';
import 'package:app_progetto/pages/homePage.dart';
import 'package:app_progetto/pages/searchPage.dart';
import 'package:app_progetto/pages/shopPage.dart';
import 'package:app_progetto/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//classe radice della mia applicazione
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), //Specifico qual è la mia pagina iniziale
      theme: lightMode,
      routes: {
        '/homePage':(context) => const HomePage(),
        '/shopPage':(context) => const ShopPage(),
        '/cartPage':(context) => const CartPage(),
        '/searchPage':(context) => SearchPage(),
      },
    );
  }
}
